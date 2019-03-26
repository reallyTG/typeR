library(ASSISTant)


### Name: ASSISTDesign
### Title: A class to encapsulate the adaptive clinical trial design of
###   Lai, Lavori and Liao
### Aliases: ASSISTDesign
### Keywords: datasets

### ** Examples

## Not run: 
##D data(LLL.SETTINGS)
##D prevalence <- LLL.SETTINGS$prevalences$table1
##D scenario <- LLL.SETTINGS$scenarios$S0
##D designParameters <- list(prevalence = prevalence,
##D                        mean = scenario$mean,
##D                        sd = scenario$sd)
##D designA <- ASSISTDesign$new(trialParameters = LLL.SETTINGS$trialParameters,
##D                             designParameters = designParameters)
##D print(designA)
##D ## A realistic design uses 5000 simulations or more!
##D result <- designA$explore(showProgress = interactive())
##D analysis <- designA$analyze(result)
##D designA$summary(analysis)
## End(Not run)
## For full examples, try:
## browseURL(system.file("full_doc/ASSISTant.html", package="ASSISTant"))




