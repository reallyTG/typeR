library(cobalt)


### Name: bal.tab.default
### Title: Balance Statistics for Other Objects
### Aliases: bal.tab.default

### ** Examples

data("lalonde", package = "cobalt")
covs <- subset(lalonde,  select = -c(treat, re78))

##Writing a function the produces output for direct
##use in bal.tab.default

ate.weights <- function(treat, covs) {
    data <- data.frame(treat, covs)
    formula <- formula(data)
    ps <- glm(formula, data = data, 
              family = "binomial")$fitted.values
    weights <- treat/ps + (1-treat)/(1-ps)
    call <- match.call()
    out <- list(treat = treat,
                covs = covs,
                distance = ps,
                weights = weights,
                estimand = "ATE",
                call = call)
    return(out)
}

out <- ate.weights(lalonde$treat, covs)

bal.tab(out, un = TRUE)



