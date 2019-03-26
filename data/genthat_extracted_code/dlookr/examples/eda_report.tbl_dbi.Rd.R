library(dlookr)


### Name: eda_report.tbl_dbi
### Title: Reporting the information of EDA for table of the DBMS
### Aliases: eda_report.tbl_dbi

### ** Examples

## No test: 
library(dplyr)
library(dbplyr)

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

# connect DBMS
con_sqlite <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")

# copy carseats to the DBMS with a table named TB_CARSEATS
copy_to(con_sqlite, carseats, name = "TB_CARSEATS", overwrite = TRUE)

## target variable is categorical variable
# reporting the EDA information
# create pdf file. file name is EDA_Report.pdf
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(US)

# create pdf file. file name is EDA.pdf
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report("US", output_file = "EDA.pdf")

# create html file. file name is EDA_Report.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report("US", output_format = "html")

# create html file. file name is EDA.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(US, output_format = "html", output_file = "EDA.html")

## target variable is numerical variable
# reporting the EDA information, and collect size is 350
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(Sales, collect_size = 350)

# create pdf file. file name is EDA2.pdf
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report("Sales", output_file = "EDA2.pdf")

# create html file. file name is EDA_Report.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report("Sales", output_format = "html")

# create html file. file name is EDA2.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(Sales, output_format = "html", output_file = "EDA2.html")

## target variable is null
# reporting the EDA information
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report()

# create pdf file. file name is EDA2.pdf
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(output_file = "EDA2.pdf")

# create html file. file name is EDA_Report.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(output_format = "html")

# create html file. file name is EDA2.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  eda_report(output_format = "html", output_file = "EDA2.html")
## End(No test)




