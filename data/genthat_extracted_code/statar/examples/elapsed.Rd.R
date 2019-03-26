library(statar)


### Name: elapsed
### Title: Elapsed dates (monthly, quarterly)
### Aliases: elapsed quarterly, monthly as.quarterly is.quarterly
###   as.monthly is.monthly

### ** Examples

library(lubridate)
library(dplyr)
date <- mdy(c("04/03/1992", "01/04/1992", "03/15/1992"))  
datem <- as.monthly(date)
is.monthly(datem)
as.quarterly(date)
as.character(datem)
datem + 1
df <- data_frame(datem)
# filter(df, month(datem) == 1)
lag(c(1, 2, 3), n = 1, along_with = datem)
seq(datem[1], datem[2])
as.Date(datem)
as.POSIXlt(datem)
as.POSIXct(datem)
week(datem)



