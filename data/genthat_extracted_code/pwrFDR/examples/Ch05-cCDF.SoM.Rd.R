library(pwrFDR)


### Name: cCDF.SoM
### Title: Complementary CDF for the True Positive Fraction
### Aliases: cCDF.SoM
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

## Example 1: Explicit call 
   ccdf <- cCDF.SoM(lambda=0.8201087, effect.size=0.79, n.sample=46, r.1=2000/54675, 
                    FDR=0.15, N.tests=1000)
   ccdf

## Example 2: Abbreviated call using result of pwrFDR
   rslt.avgp <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
   ccdf <- cCDF.SoM(lambda=0.8201087, x=rslt.avgp, N.tests=1000)
   ccdf



