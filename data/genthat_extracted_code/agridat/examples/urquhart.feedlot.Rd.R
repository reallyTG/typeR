library(agridat)


### Name: urquhart.feedlot
### Title: Weight gain calves in a feedlot
### Aliases: urquhart.feedlot
### Keywords: datasets

### ** Examples


data(urquhart.feedlot)
dat <- urquhart.feedlot

if(require(reshape2) & require(latticeExtra)){
  d2 <- melt(dat, id.vars=c('animal','herd','diet'))

  useOuterStrips(xyplot(value ~ variable|diet*herd, data=d2, group=animal,
                        type='l',
                        xlab="Initial & slaughter timepoint for each diet",
                        ylab="Weight for each herd",
                        main="urquhart.feedlot - weight gain by animal"))
}

# simple fixed-effects model 
dat <- transform(dat, animal = factor(animal), herd=factor(herd))
m1 <- lm(weight2 ~ weight1 + herd*diet, data = dat)
coef(m1) # weight1 = 1.1373 match Urquhart table 5 common slope

# random-effects model might be better, for example
# require(lme4)
# m1 <- lmer(weight2 ~ -1 + diet + weight1 + (1|herd), data=dat)
# summary(m1) # weight1 = 1.2269




