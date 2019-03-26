library(VGAM)


### Name: bmi.nz
### Title: Body Mass Index of New Zealand Adults Data
### Aliases: bmi.nz
### Keywords: datasets

### ** Examples

## Not run: 
##D  with(bmi.nz, plot(age, BMI, col = "blue"))
##D fit <- vgam(BMI ~ s(age, df = c(2, 4, 2)), lms.yjn, data = bmi.nz, trace = TRUE)
##D qtplot(fit, pcol = "blue", tcol = "brown", lcol = "brown") 
## End(Not run)



