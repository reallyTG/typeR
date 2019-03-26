library(agridat)


### Name: john.alpha
### Title: Alpha lattice design of spring oats
### Aliases: john.alpha
### Keywords: datasets

### ** Examples


library(agridat)
data(john.alpha)
dat <- john.alpha

# RCB (no incomplete block)
m0 <- lm(yield ~ 0 + gen + rep, data=dat)

# Block fixed (intra-block analysis) (bottom of table 7.4 in John)
m1 <- lm(yield ~ 0 + gen + rep + rep:block, dat)
anova(m1)

# Block random (combined inter-intra block analysis)
if(require(lme4) & require(lucid)){
m2 <- lmer(yield ~ 0 + gen + rep + (1|rep:block), dat)

anova(m2)
## Analysis of Variance Table
##     Df Sum Sq Mean Sq  F value
## gen 24 380.43 15.8513 185.9942
## rep  2   1.57  0.7851   9.2123
vc(m2)
##        grp        var1 var2    vcov  sdcor
##  rep:block (Intercept) <NA> 0.06194 0.2489
##   Residual        <NA> <NA> 0.08523 0.2919


# Variety means.  John and Williams table 7.5.  Slight, constant
# difference for each method as compared to John and Williams.
means <- data.frame(rcb=coef(m0)[1:24],
                    ib=coef(m1)[1:24],
                    intra=fixef(m2)[1:24])
head(means)
##             rcb       ib    intra
## genG01 5.201233 5.268742 5.146433
## genG02 4.552933 4.665389 4.517265
## genG03 3.381800 3.803790 3.537934
## genG04 4.439400 4.728175 4.528828
## genG05 5.103100 5.225708 5.075944
## genG06 4.749067 4.618234 4.575394

require(lattice)
splom(means, main="john.alpha - means for RCB, IB, Intra-block")

}

# ----------------------------------------------------------------------------

## Not run: 
##D   # asreml3
##D   # Heritability calculation of Piepho & Mohring, Example 1
##D   require(asreml)
##D   m3 <- asreml(yield ~ 1 + rep, data=dat, random=~ gen + rep:block)
##D   sg2 <- summary(m3)$varcomp['gen!gen.var','component'] # .142902
##D 
##D   # Average variance of a difference of two adjusted means (BLUP)
##D   
##D   p3 <- predict(m3, data=dat, classify="gen", sed=TRUE)
##D   # Matrix of pair-wise SED values, squared
##D   vdiff <- p3$predictions$sed^2
##D   # Average variance of two DIFFERENT means (using lower triangular of vdiff)
##D   vblup <- mean(vdiff[lower.tri(vdiff)]) # .05455038
##D   
##D   # Note that without sed=TRUE, asreml reports square root of the average variance
##D   # of a difference between the variety means, so the following gives the same value
##D   # predict(m3, data=dat, classify="gen")$pred$avsed ^ 2 # .05455038
##D 
##D   # Average variance of a difference of two adjusted means (BLUE)
##D   m4 <- asreml(yield ~ 1 + gen + rep, data=dat, random = ~ rep:block)
##D   p4 <- predict(m4, data=dat, classify="gen", sed=TRUE)
##D   vdiff <- p4$predictions$sed^2
##D   vblue <- mean(vdiff[lower.tri(vdiff)]) # .07010875
##D   # Again, could use predict(m4, data=dat, classify="gen")$pred$avsed ^ 2
##D   
##D   # H^2 Ad-hoc measure of heritability
##D   sg2 / (sg2 + vblue/2) # .803
##D   
##D   # H^2c Similar measure proposed by Cullis.
##D   1-(vblup / 2 / sg2) # .809
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D   ## # Heritability calculation of Piepho & Mohring, Example 1
##D   ## require(asreml4)
##D   ## m3 <- asreml(yield ~ 1 + rep, data=dat, random=~ gen + rep:block)
##D   ## sg2 <- summary(m3)$varcomp['gen','component'] # .142902
##D 
##D   ## # Average variance of a difference of two adjusted means (BLUP)
##D   
##D   ## p3 <- predict(m3, data=dat, classify="gen", sed=TRUE)
##D   ## # Matrix of pair-wise SED values, squared
##D   ## vdiff <- p3$sed^2
##D   ## # Average variance of two DIFFERENT means (using lower triangular of vdiff)
##D   ## vblup <- mean(vdiff[lower.tri(vdiff)]) # .05455038
##D   
##D   ## # Note that without sed=TRUE, asreml reports square root of the average variance
##D   ## # of a difference between the variety means, so the following gives the same value
##D   ## # predict(m3, data=dat, classify="gen")$pred$avsed ^ 2 # .05455038
##D 
##D   ## # Average variance of a difference of two adjusted means (BLUE)
##D   ## m4 <- asreml(yield ~ 1 + gen + rep, data=dat, random = ~ rep:block)
##D   ## p4 <- predict(m4, data=dat, classify="gen", sed=TRUE)
##D   ## vdiff <- p4$sed^2
##D   ## vblue <- mean(vdiff[lower.tri(vdiff)]) # .07010875
##D   ## # Again, could use predict(m4, data=dat, classify="gen")$pred$avsed ^ 2
##D   
##D   ## # H^2 Ad-hoc measure of heritability
##D   ## sg2 / (sg2 + vblue/2) # .803
##D   
##D   ## # H^2c Similar measure proposed by Cullis.
##D   ## 1-(vblup / 2 / sg2) # .809
## End(Not run)

# ----------------------------------------------------------------------------

## Not run: 
##D 
##D   # Illustrate how to do the same calculations with lme4
##D   # http://stackoverflow.com/questions/38697477
##D   
##D  require(lme4)
##D   
##D   cov2sed <- function(x){
##D     # Convert var-cov matrix to SED matrix
##D     # sed[i,j] = sqrt( x[i,i] + x[j,j]- 2*x[i,j] )
##D     n <- nrow(x)
##D     vars <- diag(x)
##D     sed <- sqrt( matrix(vars, n, n, byrow=TRUE) +
##D                    matrix(vars, n, n, byrow=FALSE) - 2*x )
##D     diag(sed) <- 0
##D     return(sed)
##D   }
##D 
##D   # Same as asreml model m4. Note 'gen' must be first term
##D   m5blue <- lmer(yield ~ 0 + gen + rep + (1|rep:block), dat)
##D   
##D   require(emmeans)
##D   ls5blue <- emmeans(m5blue, "gen")
##D   con <- ls5blue@linfct[,1:24] # contrast matrix for genotypes
##D   # The 'con' matrix is identity diagonal, so we don't need to multiply,
##D   # but do so for a generic approach
##D   # sed5blue <- cov2sed(con ##D 
##D   tmp <- tcrossprod( crossprod(t(con), vcov(m5blue)[1:24,1:24]), con)
##D   sed5blue <- cov2sed(tmp)
##D 
##D   
##D   # vblue Average variance of difference between genotypes
##D   vblue <- mean(sed5blue[upper.tri(sed5blue)]^2) # .07010875 matches 'vblue' from asreml
##D 
##D   # Now blups
##D   m5blup <- lmer(yield ~ 0 + (1|gen) + rep + (1|rep:block), dat)
##D   re5 <- ranef(m5blup,condVar=TRUE)
##D   vv1 <- attr(re5$gen,"postVar")  
##D   vblup <- 2*mean(vv1) # .0577 not exactly same as 'vblup' above
##D   
##D   # H^2 Ad-hoc measure of heritability
##D   sg2 <- c(lme4::VarCorr(m5blup)[["gen"]])  # 0.142902
##D   sg2 / (sg2 + vblue/2) # .803 matches asreml
##D 
##D   # H^2c Similar measure proposed by Cullis.
##D   1-(vblup / 2 / sg2) # .809 from asreml, .800 from lme4
## End(Not run)

# ----------------------------------------------------------------------------




