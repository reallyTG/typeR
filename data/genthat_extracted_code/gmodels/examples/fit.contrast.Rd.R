library(gmodels)


### Name: fit.contrast
### Title: Compute and test arbitrary contrasts for regression objects
### Aliases: fit.contrast fit.contrast.lm fit.contrast.lme
### Keywords: models regression

### ** Examples

y <- rnorm(100)
x <-  cut(rnorm(100, mean=y, sd=0.25),c(-4,-1.5,0,1.5,4))
reg <- lm(y ~ x)
summary(reg)

# look at the group means
gm <- sapply(split(y,x),mean)
gm


# mean of 1st group vs mean of 4th group
fit.contrast(reg, x, c(    1,    0,    0,   -1) )
# estimate should be equal to:
gm[1] - gm[4]

# mean of 1st and 2nd groups vs mean of 3rd and 4th groups
fit.contrast(reg, x, c( -1/2, -1/2,  1/2,  1/2) )
# estimate should be equal to:
sum(-1/2*gm[1], -1/2*gm[2], 1/2*gm[3], 1/2*gm[4])

# mean of 1st group vs mean of 2nd, 3rd and 4th groups
fit.contrast(reg, x, c( -3/3,  1/3,  1/3,  1/3) )
# estimate should be equal to:
sum(-3/3*gm[1], 1/3*gm[2], 1/3*gm[3], 1/3*gm[4])

# all at once
cmat <- rbind( "1 vs 4"    =c(-1, 0, 0, 1),
               "1+2 vs 3+4"=c(-1/2,-1/2, 1/2, 1/2),
               "1 vs 2+3+4"=c(-3/3, 1/3, 1/3, 1/3))
fit.contrast(reg,x,cmat)

#
x2 <- rnorm(100,mean=y,sd=0.5)
reg2 <- lm(y ~ x + x2 )
fit.contrast(reg2,x,c(-1,0,0,1))

#
# Example for Analysis of Variance
#

set.seed(03215)
Genotype <- sample(c("WT","KO"), 1000, replace=TRUE)
Time <- factor(sample(1:3, 1000, replace=TRUE))
y <- rnorm(1000)
data <- data.frame(y, Genotype, Time)


# Compute Contrasts & obtain 95% confidence intervals

model <- aov( y ~ Genotype + Time + Genotype:Time, data=data )

fit.contrast( model, "Genotype", rbind("KO vs WT"=c(-1,1) ), conf=0.95 )

fit.contrast( model, "Time",
            rbind("1 vs 2"=c(-1,1,0),
                  "2 vs 3"=c(0,-1,1)
                  ),
            conf=0.95 )


cm.G <- rbind("KO vs WT"=c(-1,1) )
cm.T <- rbind("1 vs 2"=c(-1,1,0),
              "2 vs 3"=c(0,-1,1) )

# Compute contrasts and show SSQ decompositions

model <- aov( y ~ Genotype + Time + Genotype:Time, data=data,
              contrasts=list(Genotype=make.contrasts(cm.G),
                             Time=make.contrasts(cm.T) )
            )

summary(model, split=list( Genotype=list( "KO vs WT"=1 ),
                           Time = list( "1 vs 2" = 1,
                                        "2 vs 3" = 2 ) ) )


# example for lme
library(nlme)
data(Orthodont)
fm1 <- lme(distance ~ Sex, data = Orthodont,random=~1|Subject)

# Contrast for sex.  This example is equivalent to standard treatment
# contrast.
#
fit.contrast(fm1, "Sex", c(-1,1), conf.int=0.95 )
#
# and identical results can be obtained using lme built-in 'intervals'
#
intervals(fm1)

# Cut age into quantile groups & compute some contrasts
Orthodont$AgeGroup <- gtools::quantcut(Orthodont$age)
fm2 <- lme(distance ~ Sex + AgeGroup, data = Orthodont,random=~1|Subject)
#
fit.contrast(fm2, "AgeGroup", rbind("Linear"=c(-2,-1,1,2),
                                    "U-Shaped"=c(-1,1,1,-1),
                                    "Change-Point at 11"=c(-1,-1,1,1)),
                              conf.int=0.95)





