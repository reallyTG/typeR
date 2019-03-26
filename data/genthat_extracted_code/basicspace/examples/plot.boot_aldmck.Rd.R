library(basicspace)


### Name: plot.boot_aldmck
### Title: Bootstrapped Aldrich-McKelvey Stimulus Plots
### Aliases: plot.boot_aldmck
### Keywords: multivariate

### ** Examples



data(LC1980)
result <- boot_aldmck(data=LC1980, polarity=2, respondent=1, missing=c(0,8,9), iter=30)
plot(result)




