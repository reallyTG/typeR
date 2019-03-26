library(mondate)


### Name: Compare-methods
### Title: Comparison Methods
### Aliases: Compare-methods Compare,mondate,mondate-method
### Keywords: methods

### ** Examples

A<-mondate.ymd(2001:2003,12,31) # three year ends
B<-mondate.ymd(2001:2003, 6,30) # three mid-years
B<A                             # c(TRUE, TRUE, TRUE)



