## ---- eval=FALSE---------------------------------------------------------
#  install.packages("infuser")

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("Bart6114/infuser")

## ------------------------------------------------------------------------
library(infuser)
library(magrittr)

"Hello {{var1}}!" %>%
  infuse(var1="world")

## ------------------------------------------------------------------------
my_sql<-"SELECT * FROM Customers
WHERE Year = {{year}}
AND Month = {{month|3}};"

## ---- results='hide'-----------------------------------------------------
library(infuser)
variables_requested(my_sql, verbose = TRUE)

## ------------------------------------------------------------------------
  infuse(my_sql, year=2016, month=8)

## ------------------------------------------------------------------------
my_list<- 
  list(year=2016,
       month=8)

infuse(my_sql, my_list)

## ------------------------------------------------------------------------
infuse(my_sql, year=2016)

## ------------------------------------------------------------------------
example_file<-
  system.file("extdata", "sql1.sql", package="infuser")

example_file

## ---- results='hide'-----------------------------------------------------
variables_requested(example_file, verbose = TRUE)

## ------------------------------------------------------------------------
infuse(example_file, year = 2016, month = 12)

## ------------------------------------------------------------------------
years <- c(2013,2014,2015)
sql_string <- "SELECT * FROM T1 WHERE Year IN ({{years}})"

infuse(sql_string, years=years)

## ------------------------------------------------------------------------
infuse(sql_string, years=years, collapse_char = ";")

## ------------------------------------------------------------------------
sql<-"INSERT INTO Students (Name) VALUES ({{name}})"
name <- "Robert'); DROP TABLE Students;--"

infuse(sql, name = name)

## ------------------------------------------------------------------------
my_transform_function<-function(v){
  # replace single quotes with double quotes
  v<-gsub("'", "''", v)
  # encloses the string in single quotes
  v<-paste0("'",v,"'")
  
  return(v)
}

infuse(sql, name = name, transform_function = my_transform_function)

## ------------------------------------------------------------------------
infuse(sql, name = name, transform_function = dbplyr::build_sql)

