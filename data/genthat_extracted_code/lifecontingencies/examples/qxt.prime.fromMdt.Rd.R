library(lifecontingencies)


### Name: qxt.prime.fromMdt
### Title: Return Associated single decrement from absolute rate of
###   decrement
### Aliases: qxt.prime.fromMdt qxt.fromQxprime

### ** Examples

#Creating the valdez mdf

valdezDf<-data.frame(
x=c(50:54),
lx=c(4832555,4821937,4810206,4797185,4782737),
hearth=c(5168, 5363, 5618, 5929, 6277),
accidents=c(1157, 1206, 1443, 1679,2152),
other=c(4293,5162,5960,6840,7631))
valdezMdt<-new("mdt",name="ValdezExample",table=valdezDf) 

qxt.prime.fromMdt(object=valdezMdt,x=53,decrement="other")

#Finan example 67.2

qxt.fromQxprime(qx.prime = 0.01,other.qx.prime = c(0.03,0.06))




