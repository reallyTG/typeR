library(metaSEM)


### Name: wvs94b
### Title: Forty-four Covariance Matrices on Life Satisfaction, Job
###   Satisfaction, and Job Autonomy
### Aliases: wvs94b
### Keywords: datasets

### ** Examples

## Not run: 
##D data(wvs94b)
##D 
##D ## Get the indirect and the direct effects and
##D ## their sampling covariance matrices for each study
##D indirect1 <- indirectEffect(wvs94b$data, wvs94b$n)
##D indirect1
##D 
##D ## Multivariate meta-analysis on the indirect and direct effects
##D indirect2 <- meta(indirect1[, c("ind_eff", "dir_eff")],
##D                   indirect1[, c("ind_var", "ind_dir_cov", "dir_var")])
##D 
##D summary(indirect2)  
## End(Not run)



