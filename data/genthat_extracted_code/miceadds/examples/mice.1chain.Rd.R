library(miceadds)


### Name: mice.1chain
### Title: Multiple Imputation by Chained Equations using One Chain
### Aliases: mice.1chain summary.mids.1chain plot.mids.1chain
###   print.mids.1chain
### Keywords: Imputation mids summary plot mids.1chain

### ** Examples

#############################################################################
# EXAMPLE 1: One chain nhanes data
#############################################################################

library(mice)
data(nhanes, package="mice")
set.seed(9090)

# nhanes data in one chain
imp.mi1 <- miceadds::mice.1chain( nhanes, burnin=5, iter=40, Nimp=4,
                 method=rep("norm", 4 ) )
summary(imp.mi1)       # summary of mids.1chain
## Not run: 
##D plot( imp.mi1 ) # trace plot excluding burnin iterations
##D plot( imp.mi1, plot.burnin=TRUE ) # trace plot including burnin iterations
##D 
##D # select mids object
##D imp.mi2 <- imp.mi1$midsobj
##D summary(imp.mi2)    # summary of mids
##D 
##D # apply mice functionality lm.mids
##D mod <- with( imp.mi2, stats::lm( bmi ~ age ) )
##D summary( mice::pool( mod ) )
##D 
##D #############################################################################
##D # EXAMPLE 2: One chain (mixed data: numeric and factor)
##D #############################################################################
##D 
##D library(mice)
##D data(nhanes2, package="mice")
##D set.seed(9090)
##D 
##D # nhanes2 data in one chain
##D imp.mi1 <- miceadds::mice.1chain( nhanes2, burnin=5, iter=25, Nimp=5 )
##D # summary
##D summary( imp.mi1$midsobj )
##D 
##D #############################################################################
##D # EXAMPLE 3: Multiple imputation with counterfactuals for estimating
##D #            causal effects (average treatment effects)
##D # Schafer, J. L., & Kang, J. (2008). Average causal effects from nonrandomized
##D #    studies: a practical guide and simulated example.
##D #    Psychological Methods, 13, 279-313.
##D #############################################################################
##D 
##D data(data.ma01)
##D dat <- data.ma01[, 4:11]
##D 
##D # define counterfactuals for reading score for students with and
##D # without migrational background
##D dat$read.migrant1 <- ifelse( paste(dat$migrant)==1, dat$read, NA )
##D dat$read.migrant0 <- ifelse( paste(dat$migrant)==0, dat$read, NA )
##D 
##D # define imputation method
##D impmethod <- rep("pls", ncol(dat) )
##D names(impmethod) <- colnames(dat)
##D 
##D # define predictor matrix
##D pm <- 4*(1 - diag( ncol(dat) ) )    # 4 - use all interactions
##D rownames(pm) <- colnames(pm) <- colnames(dat)
##D pm[ c( "read.migrant0", "read.migrant1"), ] <- 0
##D # do not use counterfactuals for 'read' as a predictor
##D pm[, "read.migrant0"] <- 0
##D pm[, "read.migrant1"] <- 0
##D # define control variables for creation of counterfactuals
##D pm[ c( "read.migrant0", "read.migrant1"), c("hisei","paredu","female","books") ] <- 4
##D   ##   > pm
##D   ##                 math read migrant books hisei paredu female urban read.migrant1 read.migrant0
##D   ##   math             0    4       4     4     4      4      4     4             0             0
##D   ##   read             4    0       4     4     4      4      4     4             0             0
##D   ##   migrant          4    4       0     4     4      4      4     4             0             0
##D   ##   books            4    4       4     0     4      4      4     4             0             0
##D   ##   hisei            4    4       4     4     0      4      4     4             0             0
##D   ##   paredu           4    4       4     4     4      0      4     4             0             0
##D   ##   female           4    4       4     4     4      4      0     4             0             0
##D   ##   urban            4    4       4     4     4      4      4     0             0             0
##D   ##   read.migrant1    0    0       0     4     4      4      4     0             0             0
##D   ##   read.migrant0    0    0       0     4     4      4      4     0             0             0
##D 
##D # imputation using mice function and PLS imputation with
##D # predictive mean matching method 'pmm6'
##D imp <- mice::mice( dat, method=impmethod, predictorMatrix=pm,
##D             maxit=4, m=5, pls.impMethod="pmm5" )
##D 
##D #*** Model 1: Raw score difference
##D mod1 <- with( imp, stats::lm( read ~ migrant ) )
##D smod1 <- summary( mice::pool(mod1) )
##D   ##   > smod1
##D   ##                  est    se      t     df Pr(>|t|)  lo 95  hi 95 nmis    fmi lambda
##D   ##   (Intercept) 510.21 1.460 349.37 358.26        0 507.34 513.09   NA 0.1053 0.1004
##D   ##   migrant     -43.38 3.757 -11.55  62.78        0 -50.89 -35.87  404 0.2726 0.2498
##D 
##D #*** Model 2: ANCOVA - regression adjustment
##D mod2 <- with( imp, stats::lm( read ~ migrant + hisei + paredu + female + books) )
##D smod2 <- summary( mice::pool(mod2) )
##D   ##   > smod2
##D   ##                    est      se      t      df  Pr(>|t|)    lo 95   hi 95 nmis      fmi   lambda
##D   ##   (Intercept) 385.1506 4.12027 93.477 3778.66 0.000e+00 377.0725 393.229   NA 0.008678 0.008153
##D   ##   migrant     -29.1899 3.30263 -8.838   87.46 9.237e-14 -35.7537 -22.626  404 0.228363 0.210917
##D   ##   hisei         0.9401 0.08749 10.745  160.51 0.000e+00   0.7673   1.113  733 0.164478 0.154132
##D   ##   paredu        2.9305 0.79081  3.706   41.34 6.190e-04   1.3338   4.527  672 0.339961 0.308780
##D   ##   female       38.1719 2.26499 16.853 1531.31 0.000e+00  33.7291  42.615    0 0.041093 0.039841
##D   ##   books        14.0113 0.88953 15.751  154.71 0.000e+00  12.2541  15.768  423 0.167812 0.157123
##D 
##D #*** Model 3a: Estimation using counterfactuals
##D mod3a <- with( imp, stats::lm( I( read.migrant1 - read.migrant0) ~ 1 ) )
##D smod3a <- summary( mice::pool(mod3a) )
##D   ##   > smod3a
##D   ##                  est    se      t    df Pr(>|t|)  lo 95  hi 95 nmis    fmi lambda
##D   ##   (Intercept) -22.54 7.498 -3.007 4.315  0.03602 -42.77 -2.311   NA 0.9652 0.9521
##D 
##D #*** Model 3b: Like Model 3a but using student weights
##D mod3b <- with( imp, stats::lm( I( read.migrant1 - read.migrant0) ~ 1,
##D                         weights=data.ma01$studwgt ) )
##D smod3b <- summary( mice::pool(mod3b) )
##D   ##   > smod3b
##D   ##                  est    se      t  df Pr(>|t|)  lo 95  hi 95 nmis    fmi lambda
##D   ##   (Intercept) -21.88 7.605 -2.877 4.3  0.04142 -42.43 -1.336   NA 0.9662 0.9535
##D 
##D #*** Model 4: Average treatment effect on the treated (ATT, migrants)
##D #             and non-treated (ATN, non-migrants)
##D mod4 <- with( imp, stats::lm( I( read.migrant1 - read.migrant0) ~ 0 + as.factor( migrant) )   )
##D smod4 <- summary( mice::pool(mod4) )
##D   ##   > smod4
##D   ##                          est    se      t    df Pr(>|t|)  lo 95   hi 95 nmis    fmi lambda
##D   ##   as.factor(migrant)0 -23.13 8.664 -2.669  4.27 0.052182 -46.59  0.3416   NA 0.9682 0.9562
##D   ##   as.factor(migrant)1 -19.95 5.198 -3.837 19.57 0.001063 -30.81 -9.0884   NA 0.4988 0.4501
##D # ATN=-23.13 and ATT=-19.95
## End(Not run)



