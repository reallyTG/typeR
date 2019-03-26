library(agridat)


### Name: gomez.wetdry
### Title: Rice yield in wet & dry seasons with nitrogen fertilizer
###   treatments
### Aliases: gomez.wetdry
### Keywords: datasets

### ** Examples


data(gomez.wetdry)
dat <- gomez.wetdry

require(lattice)
foo1 <- xyplot(yield ~ nitrogen|season, data=dat, 
               group=rep,type='l',auto.key=list(columns=3),
               ylab="yield in each season",
               main="gomez.wetdry raw data & model")

# Yang & Juskiw fit a quadratic model with linear and quadratic
# contrasts using non-equal intervals of nitrogen levels.
# This example below omits the tedious contrasts

if(require(latticeExtra) & require(lme4)){
  m1 <-lmer(yield ~ season*poly(nitrogen, 2) + (1|season:rep), data=dat)
  pdat <- expand.grid(season=c('dry','wet'),
                      nitrogen=seq(from=0,to=150,by=5))
  pdat$pred <- predict(m1, newdata=pdat, re.form= ~ 0)
  foo1 + 
    xyplot(pred ~ nitrogen|season, data=pdat, type='l',lwd=2,col="black")
} else {
  foo1
}

# m2 <-lmer(yield ~ poly(nitrogen, 2) + (1|season:rep), data=dat)
# anova(m1,m2)
## m2: yield ~ poly(nitrogen, 2) + (1 | season:rep)
## m1: yield ~ season * poly(nitrogen, 2) + (1 | season:rep)
##    Df    AIC    BIC  logLik deviance  Chisq Chi Df Pr(>Chisq)    
## m2  5 86.418 93.424 -38.209   76.418                             
## m1  8 64.216 75.425 -24.108   48.216 28.202      3  3.295e-06 ***




