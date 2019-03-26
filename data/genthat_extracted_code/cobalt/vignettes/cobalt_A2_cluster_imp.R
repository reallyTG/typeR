## ---- include = FALSE----------------------------------------------------
  knitr::opts_chunk$set(message = FALSE, warning = FALSE, fig.width = 5)
#knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("MatchIt"); library("cobalt")
data("lalonde", package = "cobalt")

m.out <- matchit(treat ~ race*(age + educ + married + nodegree + re74 + re75), 
                 data = lalonde, method = "nearest", exact = "race", 
                 replace = TRUE, ratio = 2)

## ------------------------------------------------------------------------
bal.tab(m.out, cluster = "race")

## ------------------------------------------------------------------------
#Just for black and hispan
bal.tab(m.out, cluster = "race", which.cluster = c("black", "hispan"),
        cluster.summary = FALSE)

#Just the balance summary across clusters with only the mean
bal.tab(m.out, cluster = "race", which.cluster = NA, cluster.fun = "mean")

## ------------------------------------------------------------------------
bal.plot(m.out, var.name = "age", cluster = "race")

## ------------------------------------------------------------------------
love.plot(bal.tab(m.out, cluster = "race"))

## ------------------------------------------------------------------------
love.plot(bal.tab(m.out, cluster = "race"), which.cluster = NA, agg.fun = "mean")

## ------------------------------------------------------------------------
love.plot(bal.tab(m.out, cluster = "race"), which.cluster = NA, agg.fun = "range")

## ------------------------------------------------------------------------
library("MatchIt"); library("cobalt"); library("mice")
data("lalonde_mis", package = "cobalt")

#Generate imputed data sets
m <- 10 #number of imputed data sets
imp <- mice(lalonde_mis, m = m, print = FALSE) 
imp.data <- complete(imp, "long", include = FALSE)
imp.data <- imp.data[with(imp.data, order(.imp, .id)),]

#Estimate propensity scores and perform matching within each one
imp.data$ps <- imp.data$match.weight <- rep(0, nrow(imp.data))
for (i in unique(imp.data$.imp)) {
    in.imp <- imp.data$.imp == i
    imp.data$ps[in.imp] <- glm(treat ~ age + educ + race + 
                                   married + nodegree +
                                   re74 + re75, 
                               data = imp.data[in.imp,], 
                               family = "binomial")$fitted.values
    m.out <- matchit(treat ~ ps, data = imp.data[in.imp,], 
                     distance = imp.data$ps[in.imp])
    imp.data$match.weight[in.imp] <- m.out$weights
}

## ------------------------------------------------------------------------
bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75, 
        data = imp.data, weights = "match.weight", method = "matching", 
        imp = ".imp")

## ------------------------------------------------------------------------
bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75, 
        data = imp.data, weights = "match.weight", method = "matching", 
        imp = ".imp", which.imp = 1, imp.summary = FALSE)

## ------------------------------------------------------------------------
#Compute the average propensity for each ID
imp.agg <- aggregate(ps ~ treat + .id, data = imp.data, FUN = mean)
names(imp.agg)[names(imp.agg) == "ps"] <- "ps.ave"

#Perform matching on the aggregated data
m.out.ave <- matchit(treat ~ ps.ave, data = imp.agg, 
                     distance = imp.agg$ps.ave)
imp.agg$match.weight.ave <- m.out.ave$weights

## ------------------------------------------------------------------------
#Merge the data sets; ps.ave and match.weight.ave will remain
imp.data <- merge(imp.data, imp.agg, all.x = TRUE)

bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75, 
        data = imp.data, weights = "match.weight.ave", 
        method = "matching", imp = ".imp")

## ------------------------------------------------------------------------
#Estimating the weights; by = ".imp" separates by imputation
library("WeightIt")
w.out <- weightit(treat ~ age + educ + race + married + 
                      nodegree + re74 + re75, data = imp.data, 
                  by = ".imp", estimand = "ATT")

#Checking balance on the output object
bal.tab(w.out, imp = ".imp")

## ------------------------------------------------------------------------
bal.plot(treat ~ age + educ + race + married + nodegree + re74 + re75, 
         data = imp.data, weights = "match.weight", method = "matching", 
         imp = ".imp", which.imp = 1, var.name = "age")

## ------------------------------------------------------------------------
love.plot(bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75, 
                  data = imp.data, weights = "match.weight", method = "matching", 
                  imp = ".imp"), which.imp = 1, 
          var.order = "unadjusted", threshold = .2)

## ------------------------------------------------------------------------
love.plot(bal.tab(treat ~ age + educ + race + married + nodegree + re74 + re75, 
                  data = imp.data, weights = "match.weight", method = "matching", 
                  imp = ".imp"), 
          agg.fun = "range", threshold = .2)

## ------------------------------------------------------------------------
library("MatchIt"); library("cobalt"); library("mice")
data("lalonde_mis", package = "cobalt")

#Generate imputed data sets
m <- 5 #number of imputed data sets
imp <- mice(lalonde_mis, m = m, print = FALSE) 
imp.data <- complete(imp, "long", include = FALSE)

#Estimate propensity scores and perform matching within each one
imp.data$match.weight <- rep(0, nrow(imp.data))
for (i in unique(imp.data$.imp)) {
    in.imp <- imp.data$.imp == i
    m.out <- matchit(treat ~ race*(age + educ + married + nodegree + re74 + re75), 
                     data = imp.data[in.imp,], method = "nearest", exact = "race", 
                     replace = TRUE, ratio = 2)
    imp.data$match.weight[in.imp] <- m.out$weights
}

## ------------------------------------------------------------------------
bal.tab(treat ~ age + educ + married + nodegree + re74 + re75, 
        data = imp.data, weights = "match.weight", method = "matching", 
        imp = ".imp", cluster = "race")

## ------------------------------------------------------------------------
bal.plot(treat ~ age + educ + married + nodegree + re74 + re75, 
         data = imp.data, weights = "match.weight", method = "matching", 
         imp = ".imp", cluster = "race", which.imp = 1, 
         which.cluster = NULL, var.name = "age")

## ------------------------------------------------------------------------
#4)
love.plot(bal.tab(treat ~ age + educ + married + nodegree + re74 + re75, 
                  data = imp.data, weights = "match.weight", 
                  method = "matching", imp = ".imp", cluster = "race"), 
          which.imp = NA, which.cluster = NULL, 
          agg.fun = "range")

#7)
love.plot(bal.tab(treat ~ age + educ + married + nodegree + re74 + re75, 
                  data = imp.data, weights = "match.weight", 
                  method = "matching", imp = ".imp", cluster = "race"), 
          which.imp = 1, which.cluster = NULL)

