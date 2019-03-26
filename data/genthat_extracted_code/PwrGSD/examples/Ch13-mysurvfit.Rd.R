library(PwrGSD)


### Name: mysurvfit
### Title: My Survfit
### Aliases: mysurvfit
### Keywords: survival

### ** Examples

  library(PwrGSD)
  data(lung)

  fit.msf <- mysurvfit(Surv(time, I(status==2)) ~ sex, data=lung)

  fit.msf
  ## Not run: 
##D   plot(fit.msf)
##D   
## End(Not run)



