library(agridat)


### Name: ilri.sheep
### Title: Birth weight and weaning weight of Dorper x Red Maasi lambs
### Aliases: ilri.sheep
### Keywords: datasets

### ** Examples


data(ilri.sheep)
dat <- ilri.sheep
dat <- transform(dat, lamb=factor(lamb), ewe=factor(ewe), ram=factor(ram),
                 year=factor(year))
# dl is linear covariate, same as damage, but truncated to [2,8]
dat <- within(dat, {
  dl <- damage
  dl <- ifelse(dl < 3, 2, dl)
  dl <- ifelse(dl > 7, 8, dl)
  dq <- dl^2
})

dat <- subset(dat, !is.na(weanage))

# EDA
require(lattice)
## bwplot(weanwt ~ year, dat, main="ilri.sheep", xlab="year", ylab="Wean weight",
##        panel=panel.violin) # Year effect
bwplot(weanwt ~ factor(dl), dat,
       main="ilri.sheep", xlab="Dam age", ylab="Wean weight") # Dam age effect
# bwplot(weanwt ~ gen, dat,
#        main="ilri.sheep", xlab="Genotype", ylab="Wean weight") # Genotype differences
xyplot(weanwt ~ weanage, dat, type=c('p','smooth'),
       main="ilri.sheep", xlab="Wean age", ylab="Wean weight") # Age covariate

# case study page 4.18
lm1 <- lm(weanwt ~ year + sex + weanage + dl + dq + ewegen + ramgen, data=dat)
summary(lm1)
anova(lm1)

# ----------------------------------------------------------------------------

## Not run: 
##D   require(lme4)
##D   lme1 <- lmer(weanwt ~ year + sex + weanage + dl + dq + ewegen + ramgen +
##D                  (1|ewe) + (1|ram), data=dat)
##D   print(lme1, corr=FALSE)
##D   lme2 <- lmer(weanwt ~ year + sex + weanage + dl + dq + ewegen + ramgen +
##D                  (1|ewe), data=dat)
##D   lme3 <- lmer(weanwt ~ year + sex + weanage + dl + dq + ewegen + ramgen +
##D                  (1|ram), data=dat)
##D   anova(lme1, lme2,  lme3)
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   require(asreml)
##D   # case study page 4.20
##D   m1 <- asreml(weanwt ~ year + sex + weanage + dl + dq + ramgen + ewegen,
##D                data=dat)
##D   anova(m1)
##D   
##D   # case study page 4.26
##D   m2 <- asreml(weanwt ~ year + sex + weanage + dl + dq + ramgen + ewegen,
##D                random = ~ ram + ewe, data=dat)
##D   anova(m2)
##D   
##D   # case study page 4.37, year means
##D   predict(m2, data=dat, classify="year")$predictions  
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## require(asreml4)
##D   ## # case study page 4.20
##D   ## m1 <- asreml(weanwt ~ year + sex + weanage + dl + dq + ramgen + ewegen,
##D   ##              data=dat)
##D   ## wald(m1)
##D   
##D   ## # case study page 4.26
##D   ## m2 <- asreml(weanwt ~ year + sex + weanage + dl + dq + ramgen + ewegen,
##D   ##              random = ~ ram + ewe, data=dat)
##D   ## wald(m2)
##D   
##D   ## # case study page 4.37, year means
##D   ## predict(m2, data=dat, classify="year")  
## End(Not run)




