library(mondate)


### Name: seq.mondate
### Title: Mondate Sequence Generation
### Aliases: seq seq.mondate

### ** Examples

x<-mondate.ymd(2010,1)
x                          # January 31, 2010
y<-mondate.ymd(2010,12)
y                          # December 31, 2010
seq(from=x, to=y)  # all month-ends in 2010
# 8 quarter-ends beginning 1st quarter 2009; US displayFormat
seq(mondate("3/31/2009"), by=3, length.out=8) 
# 8 quarter-ends ending year-end 2009; non-US displayFormat
seq(to=mondate("2009/12/31"), by=3, length.out=8) 



