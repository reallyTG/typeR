library(congressbr)


### Name: sen_bills_updates
### Title: Downloads and tidies information on bills that have been
###   recently updated in the Federal Senate
### Aliases: sen_bills_updates

### ** Examples

# Bills from 2014 that have had a "despacho" update in the last 15 days, if
# they exist:
## No test: 
desp_2014 <- sen_bills_updates(update = "Despacho", year = 2014, days = 15)

# PLS bills that have been updated in the last 10 days, if they exist:
pls <- sen_bills_updates(type = "PLS", days = 10)
## End(No test)



