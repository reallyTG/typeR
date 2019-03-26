library(pwrFDR)


### Name: cCDF.ToJ
### Title: Complementary CDF for the False Discovery Fraction
### Aliases: cCDF.ToJ
### Keywords: FDR Benjamini Hochberg microarrays Multiple.Testing
###   average.power k.power lambda.power

### ** Examples

## Example 1: Explicit call 
   ccdf <- cCDF.ToJ(lambda=(1-2000/54675)*0.15, effect.size=0.79, n.sample=46, r.1=2000/54675, 
                    FDR=0.15, N.tests=1000)
   ccdf

## Example 2: Abbreviated call using result of pwrFDR
   rslt.avgp <- pwrFDR(effect.size=0.79, n.sample=46, r.1=2000/54675, FDR=0.15)
   ccdf <- cCDF.ToJ(lambda=(1-2000/54675)*0.15, x=rslt.avgp, N.tests=1000)
   ccdf



