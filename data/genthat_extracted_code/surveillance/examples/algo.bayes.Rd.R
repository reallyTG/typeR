library(surveillance)


### Name: algo.bayes
### Title: The Bayes System
### Aliases: algo.bayes algo.bayesLatestTimepoint algo.bayes1 algo.bayes2
###   algo.bayes3
### Keywords: classif

### ** Examples

    disProg <- sim.pointSource(p = 0.99, r = 0.5, length = 208, A = 1,
                                    alpha = 1, beta = 0, phi = 0,
                                    frequency = 1, state = NULL, K = 1.7)

    # Test for bayes 1 the latest timepoint
    algo.bayesLatestTimepoint(disProg)

    # Test week 200 to 208 for outbreaks with a selfdefined bayes
    algo.bayes(disProg, control = list(range = 200:208, b = 1,
                                                w = 5, actY = TRUE,alpha=0.05))
    # The same for bayes 1 to bayes 3
    algo.bayes1(disProg, control = list(range = 200:208,alpha=0.05))
    algo.bayes2(disProg, control = list(range = 200:208,alpha=0.05))
    algo.bayes3(disProg, control = list(range = 200:208,alpha=0.05))



