library(asht)


### Name: anovaOneWay
### Title: One-Way ANOVA
### Aliases: anovaOneWay
### Keywords: htest

### ** Examples

require(datasets)
library(asht)
ChickWeightTime20<-ChickWeight[ChickWeight$Time==20,]

anovaOneWay(1:10,c(rep(1,4),rep(2,6)))
anova(lm(weight~Diet,data=ChickWeightTime20))
t.test(ChickWeightTime20$weight[ChickWeightTime20$Diet==1],
       ChickWeightTime20$weight[ChickWeightTime20$Diet==2],
       var.equal=FALSE)
anovaOneWay(ChickWeightTime20$weight, ChickWeightTime20$Diet,       
     var.equal=FALSE)



