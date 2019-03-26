library(powerAnalysis)


### Name: power.plot.chisq
### Title: Power analysis plot of chi-squared test
### Aliases: power.plot.chisq

### ** Examples

## 'ne' type
### multiple effect size and multiple power
es=seq(from=0.1,to=0.5,by=0.1);
power=seq(from=0.7,to=0.9,by=0.1);
power.plot.chisq(es=es,power=power,df=1,sig.level=0.05,type="ne")
power.plot.chisq(es=es,power=power,df=1,sig.level=0.05,type="np")

### multiple effect size and single power
power.plot.chisq(es=seq(0.05,0.3,0.05),power=0.8,df=1,sig.level=0.05,type="ne")
power.plot.chisq(es=seq(0.05,0.3,0.05),power=0.8,df=1,sig.level=0.05,type="np")

### single effect size and single power
power.plot.chisq(es=0.2,power=0.8,df=1,sig.level=0.05,type="ne")
power.plot.chisq(es=0.2,power=0.8,df=1,sig.level=0.05,type="np")

### single effect size and multiple power
power.plot.chisq(es=0.2,power=seq(0.5,0.9,0.1),df=1,sig.level=0.05,type="ne")
power.plot.chisq(es=0.2,power=seq(0.5,0.9,0.1),df=1,sig.level=0.05,type="np")



