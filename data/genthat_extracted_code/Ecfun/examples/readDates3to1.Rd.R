library(Ecfun)


### Name: readDates3to1
### Title: read.csv with Dates in 3 columns
### Aliases: readDates3to1
### Keywords: IO

### ** Examples

##
## 1.  Write a file to be read
##
cow0 <- data.frame(rec=1:3, startMonth=4:6, startDay=7:9, 
    startYear=1971:1973, endMonth1=10:12, endDay1=13:15, 
    endYear1=1974:1976, txt=letters[1:3])
    
write.csv(cow0, "cow0.csv", row.names=FALSE)
##
## 2.  Read it 
##
cow0. <- readDates3to1("cow0.csv")

# check 
cow0x <- data.frame(rec=1:3, txt=letters[1:3], 
    start=as.Date(c('1971-04-07', '1972-05-08', '1973-06-09')), 
    end1=as.Date(c('1974-10-13', '1975-11-14', '1976-12-15')) )

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(cow0., cow0x)
## Don't show: 
)
## End(Don't show)




