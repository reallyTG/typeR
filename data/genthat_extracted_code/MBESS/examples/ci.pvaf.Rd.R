library(MBESS)


### Name: ci.pvaf
### Title: Confidence Interval for the Proportion of Variance Accounted for
###   (in the dependent variable by knowing the levels of the factor)
### Aliases: ci.pvaf
### Keywords: design

### ** Examples

## Not run: 
##D ## Bargman (1970) gave an example in which a 5-group ANOVA with 11 subjects in each 
##D ## group is conducted and the observed F value is 11.2213. This example was used 
##D ## in Venables (1975),  Fleishman (1980), and Steiger (2004). If one wants to calculate the 
##D ## exact confidence interval for the proportion of variance accounted for in that example, 
##D ## this function can be used.
##D 
##D ci.pvaf(F.value=11.221, df.1=4, df.2=50, N=55)
##D 
##D ci.pvaf(F.value=11.221, df.1=4, df.2=50, N=55, conf.level=.90)
##D 
##D ci.pvaf(F.value=11.221, df.1=4, df.2=50, N=55,  alpha.lower=0, alpha.upper=.05)
## End(Not run)



