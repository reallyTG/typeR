library(Ecfun)


### Name: Dates3to1
### Title: Convert 3-column dates in data to class Date
### Aliases: Dates3to1
### Keywords: manip

### ** Examples

cow0 <- data.frame(rec=1:3, startMonth=4:6, startDay=7:9, 
    startYear=1971:1973, endMonth1=10:12, endDay1=13:15, 
    endYear1=1974:1976, txt=letters[1:3])

cow0. <- Dates3to1(cow0)

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



