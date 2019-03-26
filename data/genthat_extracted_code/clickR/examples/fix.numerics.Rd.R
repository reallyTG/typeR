library(clickR)


### Name: fix.numerics
### Title: Fix numeric data
### Aliases: fix.numerics

### ** Examples

mydata<-data.frame(Numeric1=c(7.8, 9.2, 5.4, 3.3, "6,8", "3..3"),
                   Numeric2=c(3.1, 1.2, "3.s4", "a48,s5", 7, "6,,4"))
report(mydata)
report(fix.numerics(mydata, k=5))



