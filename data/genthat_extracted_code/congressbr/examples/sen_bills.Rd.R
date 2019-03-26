library(congressbr)


### Name: sen_bills
### Title: Downloads and tidies information on the legislation in the
###   Federal Senate
### Aliases: sen_bills

### ** Examples

pls_5_2010 <- sen_bills(type = "PLS", number = 5, year = 2010)

# Get info on the first bill in the dataframe returned
# by sen_bills_current(), which has an id of 25:
sen25 <- sen_bills(bill_id = 25)



