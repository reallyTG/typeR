library(agridat)


### Name: hanover.whitepine
### Title: Mating crosses of white pine trees
### Aliases: hanover.whitepine
### Keywords: datasets

### ** Examples


data(hanover.whitepine)
dat <- hanover.whitepine

require(lattice)
# Relatively high male-female interaction in growth comared
# to additive gene action. Response is more consistent within
# male progeny than female progeny.
# with(dat, interaction.plot(female, male, length))
# with(dat, interaction.plot(male, female, length))
bwplot(length ~ male|female, data=dat,
       main="hanover.whitepine - length for male:female crosses",
       xlab="Male parent", ylab="Epicotyl length")

# Progeny sums match Becker p 83
sum(dat$length) # 380.58
aggregate(length ~  female + male, data=dat, FUN=sum)

# Sum of squares matches Becker p 85
m1 <- aov(length ~ rep + male + female + male:female, data=dat)
anova(m1)

## Not run: 
##D   # Variance components match Becker p. 85
##D   require(lme4)
##D   require(lucid)
##D   m2 <- lmer(length ~ (1|rep) + (1|male) + (1|female) + (1|male:female), data=dat)
##D   #as.data.frame(lme4::VarCorr(m2))
##D   vc(m2)
##D   ##         grp        var1 var2    vcov  sdcor
##D   ## male:female (Intercept) <NA> 0.1369  0.3699
##D   ##      female (Intercept) <NA> 0.02094 0.1447
##D   ##        male (Intercept) <NA> 0.1204  0.3469
##D   ##         rep (Intercept) <NA> 0.01453 0.1205
##D   ##    Residual        <NA> <NA> 0.2004  0.4477
##D   
##D   # Becker used this value for variability between individuals, within plot
##D   s2w <- 1.109
##D   
##D   # Calculating heritability for individual trees
##D   s2m <- .120
##D   s2f <- .0209
##D   s2mf <- .137
##D   vp <- s2m + s2f + s2mf + s2w  # variability of phenotypes = 1.3869
##D   4*s2m / vp # heritability male 0.346
##D   4*s2f / vp # heritability female 0.06
##D   2*(s2m+s2f)/vp # heritability male+female .203
##D   # As shown in the boxplot, heritability is stronger through the
##D   # males than through the females.
## End(Not run)




