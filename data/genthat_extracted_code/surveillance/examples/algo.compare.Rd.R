library(surveillance)


### Name: algo.compare
### Title: Comparison of Specified Surveillance Systems using Quality
###   Values
### Aliases: algo.compare
### Keywords: classif

### ** Examples

# Create a test object
disProgObj <- sim.pointSource(p = 0.99, r = 0.5, length = 400,
                              A = 1, alpha = 1, beta = 0, phi = 0,
                              frequency = 1, state = NULL, K = 1.7)

# Let this object be tested from any methods in range = 200:400
range <- 200:400
survRes <- algo.call(disProgObj,
                     control = list(
                         list(funcName = "rki1", range = range),
                         list(funcName = "rki2", range = range),
                         list(funcName = "rki3", range = range),
                         list(funcName = "rki", range = range,
                              b = 3, w = 2, actY = FALSE),
                         list(funcName = "rki", range = range,
                              b = 2, w = 9, actY = TRUE),
                         list(funcName = "bayes1", range = range),
                         list(funcName = "bayes2", range = range),
                         list(funcName = "bayes3", range = range),
                         list(funcName = "bayes", name = "myBayes",
                              range = range, b = 1, w = 5, actY = TRUE,alpha=0.05)
                     ))
algo.compare(survRes)



