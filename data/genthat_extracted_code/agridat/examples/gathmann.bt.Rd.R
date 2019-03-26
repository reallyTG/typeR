library(agridat)


### Name: gathmann.bt
### Title: Impact of Bt corn on non-target species
### Aliases: gathmann.bt

### ** Examples


data(gathmann.bt)
dat <- gathmann.bt


# EDA suggests Bt vs ISO is significant for thysan, not for aranei
require(lattice)
if(require(reshape2)){
d2 <- melt(dat, id.var='gen')
bwplot(value ~ gen|variable, d2,
       main="gathmann.bt", ylab="Insect abundance",
       panel=function(x,y,...){
         panel.xyplot(jitter(as.numeric(x)),y,...)
         panel.bwplot(x,y,...)
       },
       scales=list(relation="free"))
}


## Not run: 
##D 
##D   # ----- Parametric CI.  Thysan significant, aranei not significant.
##D   require(equivalence)
##D 
##D   th0 <- with(dat, tost(thysan[1:8], thysan[9:16], alpha=.05, paired=FALSE))
##D   lapply(th0[c("estimate","tost.interval")], round, 2)
##D   # 14.28-8.72=5.56, (2.51, 8.59) # match Gathmann p. 11
##D 
##D   ar0 <- with(dat, tost(aranei[1:8], aranei[9:16], alpha=.05, epsilon=.4))
##D   lapply(ar0[c("estimate","tost.interval")], round, 2)
##D   # .57-.47=.10, (-0.19, 0.40) # match Gathmann p. 11
##D 
##D   # ----- Non-parametric exact CI.  Same result.
##D   require(coin)
##D 
##D   th1 <- wilcox_test(thysan ~ gen, data=dat, conf.int=TRUE, conf.level=0.90)
##D   lapply(confint(th1), round, 2)
##D   # 6.36, (2.8, 9.2) # Match Gathmann p. 11
##D 
##D   ar1 <- wilcox_test(aranei ~ gen, data=dat, conf.int=TRUE, conf.level=0.90)
##D   lapply(confint(ar1), round, 2)
##D   # .05 (-.2, .4)
##D   
##D   
##D   # ----- Log-transformed exact CI. Same result.
##D   th2 <- wilcox_test(log(thysan) ~ gen, data=dat, alternative=c("two.sided"),
##D                      conf.int=TRUE, conf.level=0.9)
##D   lapply(confint(th2), function(x) round(exp(x),2))
##D   # 1.66, (1.38, 2.31) # Match Gathmann p 11
##D   
##D   # ----- Log-transform doesn't work on aranei, but asinh(x/2) does
##D   ar2 <- wilcox_test(asinh(aranei/2) ~ gen, data=dat,
##D                      alternative=c("two.sided"),
##D                      conf.int=TRUE, conf.level=0.9)
##D   lapply(confint(ar2), function(x) round(sinh(x)*2,1))
##D 
## End(Not run)



