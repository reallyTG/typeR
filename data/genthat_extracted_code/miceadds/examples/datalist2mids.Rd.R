library(miceadds)


### Name: datlist2mids
### Title: Converting a List of Multiply Imputed Data Sets into a 'mids'
###   Object
### Aliases: datalist2mids datlist2mids
### Keywords: mids mice utility function

### ** Examples

#############################################################################
# EXAMPLE 1: Imputation of NHANES data using Amelia package
#############################################################################

library(mice)
library(Amelia)

data(nhanes,package="mice")
set.seed(566)  # fix random seed

# impute 10 datasets using Amelia
a.out <- Amelia::amelia(x=nhanes, m=10)
# plot of observed and imputed data
plot(a.out)

# convert list of multiply imputed datasets into a mids object
a.mids <- miceadds::datlist2mids( a.out$imputations )

# linear regression: apply mice functionality lm.mids
mod <- with( a.mids, stats::lm( bmi ~ age ) )
summary( mice::pool( mod ) )
  ##                    est       se         t       df     Pr(>|t|)     lo 95
  ##  (Intercept) 30.624652 2.626886 11.658158 8.406608 1.767631e-06 24.617664
  ##  age         -2.280607 1.323355 -1.723352 8.917910 1.192288e-01 -5.278451
  ##                   hi 95 nmis       fmi    lambda
  ##  (Intercept) 36.6316392   NA 0.5791956 0.4897257
  ##  age          0.7172368    0 0.5549945 0.4652567

## Not run: 
##D # fit linear regression model in Zelig
##D library(Zelig)
##D mod2 <- Zelig::zelig( bmi ~ age, model="ls", data=a.out, cite=FALSE)
##D summary(mod2)
##D   ##  Model: Combined Imputations
##D   ##              Estimate Std.Error z value Pr(>|z|)
##D   ##  (Intercept)   30.625     2.627  11.658  0.00000 ***
##D   ##  age           -2.281     1.323  -1.723  0.08482
##D   ##  ---
##D   ##  Signif. codes:  '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
##D 
##D # fit linear regression using mitools package
##D library(mitools)
##D datimp <- mitools::imputationList(a.out$imputations)
##D mod3 <- with( datimp, stats::lm( bmi ~ age ) )
##D summary( mitools::MIcombine( mod3 ) )
##D   ##  Multiple imputation results:
##D   ##        with(datimp, stats::lm(bmi ~ age))
##D   ##        MIcombine.default(mod3)
##D   ##                results       se    (lower     upper) missInfo
##D   ##  (Intercept) 30.624652 2.626886 25.304594 35.9447092     51 ##D 
##D   ##  age         -2.280607 1.323355 -4.952051  0.3908368     49 ##D 
## End(Not run)



