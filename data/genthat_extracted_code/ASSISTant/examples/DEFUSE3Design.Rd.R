library(ASSISTant)


### Name: DEFUSE3Design
### Title: The DEFUSE3 design
### Aliases: DEFUSE3Design
### Keywords: datasets

### ** Examples

trialParameters <- list(N = c(200, 340, 476), type1Error = 0.025,
                        eps = 1/2, type2Error = 0.1)
designParameters <- list(
   nul0 = list(prevalence = rep(1/6, 6), mean = matrix(0, 2, 6),
               sd = matrix(1, 2, 6)),
   alt1 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6),
               c(0.5, 0.4, 0.3, 0, 0, 0)),
               sd = matrix(1, 2, 6)),
   alt2 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6),
               c(0.5, 0.5, 0, 0, 0, 0)),
               sd = matrix(1,2, 6)),
   alt3 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6), rep(0.36, 6)),
               sd = matrix(1,2, 6)),
   alt4 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6), rep(0.30, 6)),
               sd = matrix(1,2, 6)),
   alt5 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6),
               c(0.4, 0.3, 0.2, 0, 0, 0)),
               sd = matrix(1,2, 6)),
   alt6 = list(prevalence = rep(1/6, 6), mean = rbind(rep(0, 6),
               c(0.5, 0.5, 0.3, 0.3, 0.1, 0.1)),
               sd = matrix(1,2, 6)))

## Not run: 
##D ## A realistic design uses 5000 simulations or more!
##D defuse3 <- DEFUSE3Design$new(trialParameters = trialParameters,
##D                              numberOfSimulations = 25,
##D                              designParameters = designParameters$nul0,
##D                              showProgress = FALSE)
##D print(defuse3)
##D result <- defuse3$explore(showProgress = interactive())
##D analysis <- defuse3$analyze(result)
##D print(defuse3$summary(analysis))
## End(Not run)
## For full examples, try:
## browseURL(system.file("full_doc/defuse3.html", package="ASSISTant"))




