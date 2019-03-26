library(splusTimeDate)


### Name: timeSeq
### Title: Sequences of Times
### Aliases: timeSeq
### Keywords: chron

### ** Examples

timeSeq("1/1/1992", "1/10/1992") 
timeSeq("1/1/1992", "12/1/1992", by = "months") 
timeSeq("1/3/1992", "12/5/1992", by = "months", align.by=TRUE) 
timeSeq("1/3/1992", "12/5/1992", by = "months", align.by=TRUE, extend=TRUE) 
timeSeq("1/1/1992", "1/31/1992", by = "weeks", align.by=TRUE,  
   week.align="Mon") 
timeSeq("1/1/1992", "12/31/1992", by="weekdays", exceptions=holidays(1992))
timeSeq("1/1/1992", "1/1/1995", by="months", exceptions=timeEvent("1/1/1993", "12/31/1993"))
## subtract one day from a first-of-month sequence to create
## an end-of-month sequence
timeSeq(from = "2/1/2003", to = "1/1/2004", by = "months" ) - 1



