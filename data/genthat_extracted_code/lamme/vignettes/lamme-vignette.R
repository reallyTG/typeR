## ------------------------------------------------------------------------
library(lamme)
data("schoene")
attach(schoene)
summary(schoene)
c('sd_pre'=sd(pre_HRT),'sd_post'=sd(post_HRT))

## ------------------------------------------------------------------------
abc(post_HRT,group,pre_HRT)

## ------------------------------------------------------------------------
lancova(post_HRT,group,pre_HRT)

## ------------------------------------------------------------------------
boot.es(post_HRT,group,pre_HRT)

## ------------------------------------------------------------------------
par(mfrow=c(2,2))
lanova(post_HRT,group)

## ------------------------------------------------------------------------
# power in three-group LANOVA with per-group sample size of 40 given small population 
# effect
pwr.lanova(3,40,.01,.05)
# power in three-group LANCOVA with per-group sample size of 40 and pretest-posttest 
# correlation of .5 given small population effect
pwr.lancova(3,40,.01,.5,.05)

## ------------------------------------------------------------------------
# sample size planning in three-group LANOVA with desired power of .8 and 
# significance level of .05 given assumed small population effect
ss.lanova(3,.01,.8,.05)
# sample size planning in three-group LANOVA with desired power of .8 and 
# significance level of .05 and pretest-posttest correlation of .5 given 
# assumed small population effect
ss.lancova(3,.01,.5,.8,.05)

