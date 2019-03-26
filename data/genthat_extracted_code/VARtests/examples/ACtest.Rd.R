library(VARtests)


### Name: ACtest
### Title: Test for Error Autocorrelation in VAR Models.
### Aliases: ACtest print.ACtest

### ** Examples


fit <- VARfit(y = VodafoneCDS, p = 3, const = TRUE, trend = FALSE)
test <- ACtest(fit = fit, h = 1, HCtype = c("LM", "HC0", "HC1", "HC2", "HC3"))




