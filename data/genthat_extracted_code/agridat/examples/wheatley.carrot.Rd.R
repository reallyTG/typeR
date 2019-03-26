library(agridat)


### Name: wheatley.carrot
### Title: Insecticide treatments for carrot fly larvae
### Aliases: wheatley.carrot
### Keywords: datasets

### ** Examples


data(wheatley.carrot)
dat <- wheatley.carrot

# Observed proportions of damage
dat <- transform(dat, prop=damaged/total)
require(lattice)
xyplot(prop~depth|insecticide, data=dat, subset=treatment!="T11",
       cex=1.5, main="wheatley.carrot", ylab="proportion damaged")

# Model for Wheatley. Deviance for treatment matches Wheatley, but other
# deviances do not.  Why?
# treatment:rep is the residual
m1 <- glm(cbind(damaged,total-damaged) ~ rep + treatment + treatment:rep,
          data=dat, family=binomial("cloglog"))
anova(m1)

# GLM of Hardin & Hilbe p. 161. By default, R uses T01 as the base,
# but Hardin uses T11. Results match.
m2 <- glm(cbind(damaged,total-damaged) ~ rep + C(treatment, base=11),
          data=dat, family=binomial("cloglog"))
summary(m2)




