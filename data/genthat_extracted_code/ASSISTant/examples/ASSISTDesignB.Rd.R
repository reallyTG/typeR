library(ASSISTant)


### Name: ASSISTDesignB
### Title: A fixed sample design to compare against the adaptive clinical
###   trial design of Lai, Lavori and Liao.
### Aliases: ASSISTDesignB
### Keywords: datasets

### ** Examples

## Not run: 
##D data(LLL.SETTINGS)
##D prevalence <- LLL.SETTINGS$prevalences$table1
##D scenario <- LLL.SETTINGS$scenarios$S0
##D designParameters <- list(prevalence = prevalence,
##D                        mean = scenario$mean,
##D                        sd = scenario$sd)
##D designB <- ASSISTDesignB$new(trialParameters = LLL.SETTINGS$trialParameters,
##D                             designParameters = designParameters)
##D print(designB)
##D ## A realistic design uses 5000 simulations or more!
##D result <- designB$explore(showProgress = interactive())
##D analysis <- designB$analyze(result)
##D designB$summary(analysis)
## End(Not run)
## For full examples, try:
## browseURL(system.file("full_doc/ASSISTant.html", package="ASSISTant"))




