library(dlookr)


### Name: eda_report
### Title: Reporting the information of EDA
### Aliases: eda_report eda_report.data.frame

### ** Examples

## No test: 
library(dplyr)

# Generate data for the example
carseats <- ISLR::Carseats
carseats[sample(seq(NROW(carseats)), 20), "Income"] <- NA
carseats[sample(seq(NROW(carseats)), 5), "Urban"] <- NA

## target variable is categorical variable
# reporting the EDA information
# create pdf file. file name is EDA_Report.pdf
eda_report(carseats, US)
# create pdf file. file name is EDA.pdf
eda_report(carseats, "US", output_file = "EDA.pdf")
# create html file. file name is EDA_Report.html
eda_report(carseats, "US", output_format = "html")
# create html file. file name is EDA.html
eda_report(carseats, US, output_format = "html", output_file = "EDA.html")

## target variable is numerical variable
# reporting the EDA information
eda_report(carseats, Sales)
# create pdf file. file name is EDA2.pdf
eda_report(carseats, "Sales", output_file = "EDA2.pdf")
# create html file. file name is EDA_Report.html
eda_report(carseats, "Sales", output_format = "html")
# create html file. file name is EDA2.html
eda_report(carseats, Sales, output_format = "html", output_file = "EDA2.html")

## target variable is null
# reporting the EDA information
eda_report(carseats)
# create pdf file. file name is EDA2.pdf
eda_report(carseats, output_file = "EDA2.pdf")
# create html file. file name is EDA_Report.html
eda_report(carseats, output_format = "html")
# create html file. file name is EDA2.html
eda_report(carseats, output_format = "html", output_file = "EDA2.html")
## End(No test)




