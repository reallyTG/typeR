library(FSAdata)


### Name: CrappieARMS
### Title: Stock and recruitment data for Crappies from four reservoirs in
###   Arkansas and Mississippi, USA.
### Aliases: CrappieARMS
### Keywords: datasets

### ** Examples

data(CrappieARMS)
str(CrappieARMS)
head(CrappieARMS)
op <- par(mfrow=c(2,2),mar=c(3,3,2,1),mgp=c(1.75,0.5,0),tcl=-0.2,pch=19)
plot(recruits~stock,data=CrappieARMS,subset=(reservoir=="Atkins"),main="Atkins")
plot(recruits~stock,data=CrappieARMS,subset=(reservoir=="Nimrod"),main="Nimrod")
plot(recruits~stock,data=CrappieARMS,subset=(reservoir=="Okatibbee"),main="Okatibbee")
plot(recruits~stock,data=CrappieARMS,subset=(reservoir=="Ross.Barnett"),main="Ross Barnett")
par(op)




