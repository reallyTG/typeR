library(FamEvent)


### Name: summary.penmodel
### Title: Summary method for class 'penmodel'
### Aliases: summary.penmodel
### Keywords: summary

### ** Examples

# Simulated family data 

fam <- simfam(N.fam=300, design="pop+", variation="none", base.dist="Weibull", 
       base.parms=c(0.01,3), vbeta=c(-1.13, 2.35), agemin=20, allelefreq=0.02)
 
# Penetrance model fit for the simulated family data

fit <- penmodel(parms=c(0.01, 3), vbeta=c(-1.13, 2.35), data=fam, 
       design="pop+", base.dist="Weibull")

# Summary of the model parameter and penetrance estimates from model fit

summary(fit)

## Not run: 
##D Coefficients: 
##D             Estimate Std. Error t value Pr(>|t|)  
##D log(lambda)   -4.637    0.07989 -58.048  0.01097 *
##D log(rho)       1.094    0.03910  27.980  0.02274 *
##D beta.sex      -1.315    0.16298  -8.066  0.07852 .
##D beta.gene      2.545    0.21423  11.881  0.05346 .
##D Signif. codes:   0 '***'  0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
##D 
##D Penetrance (%) by age 70: 
##D          Male Carrier Female Carrier Male Noncarrier Female Noncarrier
##D Estimate        32.47          76.82            3.03             10.83
##D SE               3.85           3.22            0.74              2.17
##D 
##D 95% Confidence intervals on the penetrances: 
##D            Male Carrier Female Carrier Male Noncarrier Female Noncarrier
##D lowerlimit        25.59          70.43            1.94              7.43
##D upperlimit        40.70          83.08            4.85             15.87
## End(Not run)




