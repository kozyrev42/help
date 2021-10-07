// ОПЕРАТОРЫ
=        - равно
<>       - не равно
<        - меньше
>        - больше
<=       - меньше-или-равно
>=       - больше-или-равно

AND      - оператор "И",  например объединяет условия выборки
OR       - оператор "ИЛИ" (или 1, или 2, или 3, или ВСЕ)
LIKE     - даёт возможность поиска по части тескстовой строки
BETWEEN  -  BETWEEN 30 AND 40; Установка диапазона включительно указанных границ 
IN       -  IN (10,100);     должно выполниться одно из условий (или 10, или 100, или ВСЕ)
AND NOT  - 



// БАЗА
CREATE DATABASE my_db;      // команда создаёт новую базу данных с именем: my_db
DROP DATABASE my_db;        // удаление базы my_db
USE my_db;                  // команда для консоли, чтобы дать консоли управление базой 

show databases;             // в консоле, показать все базы данных
show tables;                // в консоле, показать все таблицы в текущей базе




// ТИПЫ ДАННЫХ
CHAR     - (CHARACTER) - требует чтобы данные имели фиксированную длинну    -> CHAR(1)  ->  Y
VARCHAR  - хранит текстовые данные длинной до 255 символов, легко приспосабливается к переменной длине даных (строковые операции)  -> VARCHAR(30) -> text 30 сим
BLOB     - работает с большими блоками текстовых данных (можно > 255 символов), тип ограничен в операциях

INT      - (INTEGER) (значения 'без') числа обязательно целые (положительные или отрицательные)    -> INT -> 89001001100
DEC      - (DECIMAL) (значения 'без') обеспечивает хранение чисел с заданной точностью:            -> DEC(4,2) -> 1234,12

TIME     - работает только со временем
DATE     - хранит даты, на время не обращает внимание
DATETIME - хранит дату и время




// ТАБЛИЦЫ

CREATE TABLE my_contacts
    (
        last_name VARCHAR(20) NOT NULL,               // запись не создаться, без задания значения 
        first_name VARCHAR(20) NOT NULL,
        years INT,                                    // в ячейки будет выводиться NULL, если не будет задано значение
        zarplata DEC(6,2) NOT NULL DEFAULT 0.00       // без явного задания значения, по умолчанию значение будет 0.00
    );

DROP TABLE ponchik_list;    // удаление таблицы 

DESC my_contacts;           // команда для вывода описания таблицы

INSERT INTO my_contacts (           // добавление в строки
        last_name, first_name, email, birthday
    )
VALUES (
        'Kozyrev', 'Alex', '@gmail.com', '1992-04-09'
);


INSERT INTO my_contacts    // добавление строки без указания столбцов
VALUES (
        'Ban', 'Aflik', '@gmail.com', '1970-05-05'
);
    

INSERT INTO my_contacts (       // добавление строки, без некоторых столбцов 
        last_name, birthday     // заполняются не все ячейки
    )
VALUES (
        'Kozyrev', '1992-04-09'
);
    
    
    
    
 // ВЫБОРКА
 
SELECT * FROM my_contacts;            // чтение всей таблицы  
    
SELECT * 
    FROM my_contacts                  //   вывод тех строк, при условии что столбец last_name содержит 'Obama' 
        WHERE last_name = 'Obama';    //   WHERE - ключевое слово, после которого следует условие
                                    
SELECT first_name                     // вывод только одного столбца */
    FROM my_contacts
        WHERE first_name = 'Alex';   
    
SELECT *           
    FROM my_contacts
        WHERE first_name = 'Leo'
            AND zarplata > 35;         // оператор AND - объединяет 2 условия выбокри     
    
SELECT *           
    FROM my_contacts
        WHERE zarplata = 10
            OR zarplata => 35;          // вывод строк - удовлетворяущих любое из указанных условий    
    
SELECT *           
    FROM my_contacts
        WHERE years IS NULL;      /* вывод строк содержащие NULL */

SELECT *           
    FROM my_contacts
        WHERE years IS NOT NULL;      /* вывод строк НЕ содержащие NULL */


SELECT *           
    FROM my_contacts                    /* LIKE - даёт возможность поиска по части тескстовой строки */
        WHERE first_name LIKE '%o';      /* % - значит может быть любое количество символов перер буквой о */      

SELECT *
    FROM my_contacts
        WHERE zarplata
            BETWEEN 30 AND 40;      /* Установка диапазона включительно указанных границ */


SELECT *
    FROM my_contacts
        WHERE zarplata = 10
            OR zarplata = 100;

SELECT *
    FROM my_contacts
        WHERE zarplata
            IN (10,100);        /* должно выполниться одно из условий (или 20, или 100, или ВСЕ) */

SELECT *
    FROM my_contacts
        WHERE zarplata
            NOT IN (10,100);   /* если ячека столбца содержит (значение) то запись не включается в результат запроса */


/* AND NOT */
/* Задача: показать записи, которые > 20, но не равняются 100 */
SELECT *
    FROM my_contacts
        WHERE zarplata > 20
            AND NOT zarplata = 100;

/* OR NOT */
/* Задача: зарплата >70 или те записи где нет Leo */
SELECT *
    FROM my_contacts
        WHERE zarplata > 70
            OR NOT first_name = 'leo';


/* WHERE NOT */
/* Задача: показать всё что не входит в ЭТОТ (30-40) диапазон  */
SELECT *
    FROM my_contacts
        WHERE NOT zarplata
            BETWEEN 30 AND 40;



DELETE
    FROM my_contacts                    // удаление записей, содержащих в столбце  last_name  значенин 'Kozyrev'
        WHERE last_name = 'Kozyrev'; 
    
    
    
    
UPDATE my_contacts                      //   в таблице my_contacts 
    SET zarplata = 50                   //   в столбце 'zarplata' заменяем значение на 25 
        WHERE first_name = 'Leo';       //   при выполнении этого условия   
    
UPDATE my_contacts
    SET first_name = 'Luk', zarplata = 25     //   замена нескольких столбцов в записи 
        WHERE last_name = 'Li';    
    
UPDATE my_contacts
    SET zarplata = 10;          /* назначение значния для всего столбца */

UPDATE my_contacts
    SET zarplata = zarplata + 1;        /* увеличение текущего значения на 1 */  
    
