library(Ecfun)


### Name: Date3to1
### Title: Convert three YMD vectors to a Date
### Aliases: Date3to1
### Keywords: manip

### ** Examples

date.frame <- data.frame(Year=c(NA, -1, 1971:1979), 
      Month=c(1:2, -1, NA, 13, 2, 12, 6:9), 
      Day=c(0, 0:6, NA, -1, 32) )
     
DateVecS <- Date3to1(date.frame)
DateVecE <- Date3to1(date.frame, "End")
                         
# check 
na <- c(1:5, 9:11)
DateVs <- as.Date(c(NA, NA, 
  '1971-01-01', '1972-01-01', '1973-01-01', 
  '1974-02-04', '1975-12-05', '1976-06-06', 
  '1977-07-01', '1978-08-01', '1979-09-01') ) 
DateVe <- as.Date(c(NA, NA, 
  '1971-12-31', '1972-12-31', '1973-12-31', 
  '1974-02-04', '1975-12-05', '1976-06-06', 
  '1977-07-31', '1978-08-31', '1979-09-30') ) 

attr(DateVs, 'missing') <- na
attr(DateVe, 'missing') <- na

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(DateVecS, DateVs)
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(DateVecE, DateVe)
## Don't show: 
)
## End(Don't show)



