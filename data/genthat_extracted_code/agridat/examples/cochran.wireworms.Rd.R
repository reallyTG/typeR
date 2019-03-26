library(agridat)


### Name: cochran.wireworms
### Title: Wireworms controlled by fumigants in a latin square
### Aliases: cochran.wireworms
### Keywords: datasets

### ** Examples


data(cochran.wireworms)
dat <- cochran.wireworms

if(require(desplot)){
  desplot(worms ~ col*row, data=dat,
          text=trt, cex=1, # aspect unknown
          main="cochran.wireworms")
}

# Trt K is effective, but not the others.  Really, this says it all.
require(lattice)
bwplot(worms ~ trt, dat, main="cochran.wireworms", xlab="Treatment")

# Snedecor and Cochran do ANOVA on sqrt(x+1).
dat <- transform(dat, rowf=factor(row), colf=factor(col))
m1 <- aov(sqrt(worms+1) ~ rowf + colf + trt, data=dat)
anova(m1)

# Instead of transforming, use glm
m2 <- glm(worms ~ trt + rowf + colf, data=dat, family="poisson")
anova(m2)

# GLM with random blocking.
if(require(lme4)){
m3 <- glmer(worms ~ -1 +trt +(1|rowf) +(1|colf), data=dat, family="poisson")
summary(m3)
## Fixed effects:
##      Estimate Std. Error z value Pr(>|z|)    
## trtK   0.1393     0.4275   0.326    0.745    
## trtM   1.7814     0.2226   8.002 1.22e-15 ***
## trtN   1.9028     0.2142   8.881  < 2e-16 ***
## trtO   1.7147     0.2275   7.537 4.80e-14 ***

}




