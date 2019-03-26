library(ASSISTant)


### Name: ASSISTDesignC
### Title: A fixed sample RCT design to compare against the adaptive
###   clinical trial design of Lai, Lavori and Liao.
### Aliases: ASSISTDesignC
### Keywords: datasets

### ** Examples

data(LLL.SETTINGS)
prevalence <- LLL.SETTINGS$prevalences$table1
scenario <- LLL.SETTINGS$scenarios$S0
designParameters <- list(prevalence = prevalence,
                       mean = scenario$mean,
                       sd = scenario$sd)
## A realistic design uses 5000 simulations or more!
designC <- ASSISTDesignC$new(trialParameters = LLL.SETTINGS$trialParameters,
                            designParameters = designParameters)
print(designC)
result <- designC$explore(numberOfSimulations = 100, showProgress = interactive())
analysis <- designC$analyze(result)
designC$summary(analysis)
## For full examples, try:
## browseURL(system.file("full_doc/ASSISTant.html", package="ASSISTant"))




