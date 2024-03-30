
-- Former adds_product table is modified to added_products in accordance to update database design.
ALTER TABLE `adds_product` DROP Constraint `Customer_ID`;
ALTER TABLE `adds_product` DROP COLUMN `Customer_ID`;
ALTER TABLE  `adds_product` ADD COLUMN `Cart_ID` INT;
ALTER TABLE `adds_product` RENAME `added_products`;

ALTER TABLE `added_products` ADD FOREIGN KEY (`Cart_ID`) REFERENCES `Cart`(`Cart_ID`);

ALTER TABLE `Customer` 
ADD COLUMN `Current_Cart` INT NULL AFTER `PinCode`;

ALTER TABLE `customer` 
ADD COLUMN `Password` varchar(400) NOT NULL AFTER `Current_cart`;


ALTER TABLE `Order`
ADD COLUMN `Cart_ID` INT NOT NULL,
ADD CONSTRAINT `fk_Cart_ID`
FOREIGN KEY (`Cart_ID`)
REFERENCES `Zappiedb`.`Cart`(`Cart_ID`);

-- ALTER TABLE `added_products` DROP Constraint `Prd_ID`;
ALTER TABLE `added_products` DROP PRIMARY KEY;


-- Renaming columns to ensure unform naming convention to facilitate smooth query calls from server-end programs.
ALTER TABLE Cart
RENAME COLUMN Custom_ID TO Cust_ID;

ALTER TABLE `Availability`
RENAME COLUMN `Prodct_ID` TO `Prod_ID`; 

ALTER TABLE `Availability`
RENAME COLUMN `Stor_ID` TO `Store_ID`;

ALTER TABLE `added_products` 
RENAME COLUMN `Prd_ID` TO `Prod_ID`;



ALTER TABLE `cart` 
ADD COLUMN `date_time` DATETIME NOT NULL;

