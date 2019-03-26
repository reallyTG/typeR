library(VARtests)


### Name: wildBoot
### Title: Wild Bootstrap Tests for Error Autocorrelation
### Aliases: wildBoot print.wildBoot

### ** Examples


## Not run: 
##D fit <- VARfit(y = VodafoneCDS, p = 3, const = TRUE, trend = FALSE)
##D test <- ACtest(fit = fit, h = 1, HCtype = c("LM", "HC0", "HC1", "HC2", "HC3"))
##D wb <- wildBoot(test = test, WBtype = "recursive", B = 199, 
##D                WBdist = "rademacher",  HCtype = c("LM", "HC3"))
## End(Not run)



