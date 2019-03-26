library(metaSEM)


### Name: Aloe14
### Title: Multivariate effect sizes between classroom management
###   self-efficacy (CMSE) and other variables reported by Aloe et al.
###   (2014)
### Aliases: Aloe14
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Aloe14)
##D 
##D ## Random-effects meta-analysis
##D meta1 <- meta(cbind(EE,DP,PA),
##D               cbind(V_EE, C_EE_DP, C_EE_PA, V_DP, C_DP_PA, V_PA),
##D               data=Aloe14)
##D ## Remove error code
##D meta1 <- rerun(meta1)
##D 
##D summary(meta1)
##D 
##D ## Extract the coefficients for the variance component of the random effects
##D coef1 <- coef(meta1, select="random")
##D 
##D ## Convert it into a symmetric matrix by row major
##D my.cov <- vec2symMat(coef1, byrow=TRUE)
##D 
##D ## Convert it into a correlation matrix
##D cov2cor(my.cov)
##D 
##D ## Plot the multivariate effect sizes
##D plot(meta1)
## End(Not run)



