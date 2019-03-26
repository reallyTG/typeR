library(dlookr)


### Name: diagnose_report.tbl_dbi
### Title: Reporting the information of data diagnosis for table of the
###   DBMS
### Aliases: diagnose_report.tbl_dbi

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

# reporting the diagnosis information -------------------------
# create pdf file. file name is DataDiagnosis_Report.pdf
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_report()
  
# create pdf file. file name is Diagn.pdf, and collect size is 350
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_report(collect_size = 350, output_file = "Diagn.pdf")

# create html file. file name is Diagnosis_Report.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_report(output_format = "html")

# create html file. file name is Diagn.html
con_sqlite %>% 
  tbl("TB_CARSEATS") %>% 
  diagnose_report(output_format = "html", output_file = "Diagn.html")
## End(No test)




