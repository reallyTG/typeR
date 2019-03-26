library(fmbasics)


### Name: IborIndex
### Title: IborIndex class
### Aliases: IborIndex

### ** Examples

library(lubridate)
library(fmdates)
# 3m AUD BBSW
IborIndex("BBSW", AUD(), months(3), days(0), c(AUSYCalendar()),
  "act/365", "ms", FALSE)



