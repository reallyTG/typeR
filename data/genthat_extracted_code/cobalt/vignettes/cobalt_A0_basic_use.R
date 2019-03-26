## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(message = FALSE)

## ---- include = F--------------------------------------------------------
library("cobalt")

## ---- eval = F-----------------------------------------------------------
#  install.packages("cobalt")
#  library("cobalt")

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

# Generating ATT weights as specified in Austin (2011)
lalonde$p.score <- glm(f.build("treat", covs0), data = lalonde, 
                       family = "binomial")$fitted.values
lalonde$att.weights <- with(lalonde, treat + (1-treat)*p.score/(1-p.score))

bal.tab(covs0, treat = lalonde$treat, weights = lalonde$att.weights,
        method = "weighting")


## ------------------------------------------------------------------------
bal.tab(treat ~ covs0, data = lalonde, weights = "att.weights",
        distance = "p.score", method = "weighting")

## ------------------------------------------------------------------------
bal.tab(treat ~ covs0, data = lalonde, weights = "att.weights",
        method = "weighting", binary = "std", continuous = "std")

## ------------------------------------------------------------------------
# Balance on all covariates in data set, including interactions and squares
bal.tab(treat ~ covs0, data = lalonde, weights = "att.weights",
        method = "weighting", addl = c("nodegree", "married"), 
        int = TRUE, poly = 2)

## ------------------------------------------------------------------------
# Balance tables with variance ratios and statistics for the unadjusted sample
bal.tab(treat ~ covs0, data = lalonde, weights = "att.weights",
        method = "weighting", disp.v.ratio = TRUE, un = TRUE)

## ------------------------------------------------------------------------
# Balance tables with thresholds for mean differences and variance ratios
bal.tab(treat ~ covs0, data = lalonde, weights = "att.weights",
        method = "weighting", m.threshold = .1, v.threshold = 2)

## ------------------------------------------------------------------------
# Generating ATT weights with different covariates
lalonde$p.score2 <- glm(treat ~ age + I(age^2) + race + educ + re74, 
                        data = lalonde, family = "binomial")$fitted.values
lalonde$att.weights2 <- with(lalonde, treat + (1-treat)*p.score2/(1-p.score2))

bal.tab(treat ~ covs0, data = lalonde, weights = c("att.weights", "att.weights2"),
        method = "weighting", estimand = "ATT")

## ------------------------------------------------------------------------
# Subclassification for ATT with 6 subclasses
lalonde$p.score <- glm(f.build("treat", covs0), data = lalonde, 
                       family = "binomial")$fitted.values
nsub <- 5 #number of subclasses
lalonde$subclass <- findInterval(lalonde$p.score, 
                                 quantile(lalonde$p.score[lalonde$treat == 1], 
                                          seq(0, 1, length.out = nsub + 1)), 
                                 all.inside = TRUE)

bal.tab(treat ~ covs0, data = lalonde, subclass = "subclass", 
        method = "subclassification", disp.subclass = TRUE)

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt")
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

# Nearest neighbor 2:1 matching with replacement
library("MatchIt") #if not yet loaded
m.out <- matchit(f.build("treat", covs0), data = lalonde, method = "nearest", 
                 ratio = 1,  replace = TRUE)

bal.tab(m.out)

## ------------------------------------------------------------------------
library("WeightIt")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

#Generating propensity score weights for the ATT
W.out <- weightit(treat ~ covs0, data = lalonde,
                  method = "ps", estimand = "ATT")

bal.tab(W.out)

## ---- fig.show = "hold"--------------------------------------------------
bal.plot(W.out, var.name = "age")
bal.plot(W.out, var.name = "race")

## ---- fig.width = 5------------------------------------------------------
#Before and after weighting; which = "both"
bal.plot(W.out, var.name = "prop.score", which = "both",
         type = "histogram", mirror = TRUE)

## ---- fig.width = 5------------------------------------------------------
data("lalonde", package = "cobalt")
covs <- subset(lalonde, select = -c(treat, re78))

# Nearest neighbor 1:1 matching with replacement
library("MatchIt") #if not yet loaded
m.out <- matchit(f.build("treat", covs), data = lalonde, 
                 method = "nearest", replace = TRUE)

love.plot(bal.tab(m.out), threshold = .1)

## ---- fig.width = 5------------------------------------------------------
v <- data.frame(old = c("age", "educ", "race_black", "race_hispan", 
                        "race_white", "married", "nodegree", "re74", "re75", "distance"),
                new = c("Age", "Years of Education", "Black", 
                        "Hispanic", "White", "Married", "No Degree Earned", 
                        "Earnings 1974", "Earnings 1975", "Propensity Score"))

love.plot(bal.tab(m.out), stat = "mean.diffs", threshold = .1, 
          var.order = "unadjusted", var.names = v, abs = TRUE,
          line = TRUE, limits = c(0, 1))

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt")
library("WeightIt")

#Generating weights with re75 as the continuous treatment
W.out.c <- weightit(re75 ~ age + educ + race + married + nodegree + 
                        re74 + I(re74^2), 
                    data = lalonde, method = "ps")

## ------------------------------------------------------------------------
#Assessing balance numerically
bal.tab(W.out.c, un = TRUE, r.threshold = .1, int = TRUE,
        poly = 2, imbalanced.only = TRUE)

## ---- fig.width = 5------------------------------------------------------
#Assessing balance graphically
bal.plot(W.out.c, "re74", which = "both")
bal.plot(W.out.c, "married", which = "both")

## ---- fig.width = 5------------------------------------------------------
#Summarizing balance in a Love plot
love.plot(bal.tab(W.out.c), threshold = .1, 
          var.order = "unadjusted", line = TRUE)

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt")
library("WeightIt")
cov.mn <- subset(lalonde, select = -c(treat, re78, race))

#Using WeightIt to generate weights with multinomial
#logistic regression
W.out.mn <- weightit(race ~ cov.mn, data = lalonde,
                     method = "ps")

## ------------------------------------------------------------------------
#Assessing balance numerically
bal.tab(W.out.mn, un = TRUE, which.treat = NULL)

#Just black vs. white
bal.tab(W.out.mn, un = TRUE, disp.means = TRUE,
        which.treat = c("black", "white"),
        multi.summary = FALSE)

## ---- fig.width = 5------------------------------------------------------
#Assessing balance graphically
bal.plot(W.out.mn, "age", which = "both")

bal.plot(W.out.mn, "married", which = "both",
         which.treat = c("black", "white"))

## ---- fig.width = 7------------------------------------------------------
#Summarizing balance in a Love plot
love.plot(bal.tab(W.out.mn), threshold = .1,
          which.treat = NULL, abs = FALSE)

## ------------------------------------------------------------------------
bal.tab(treat ~ covs0, data = lalonde, 
        weights = data.frame(Matched = get.w(m.out),
                             IPW = get.w(W.out)),
        method = c("matching", "weighting"), 
        disp.v.ratio = TRUE)

## ---- fig.width=7--------------------------------------------------------
bal.plot(treat ~ covs0, data = lalonde, 
         weights = data.frame(Matched = get.w(m.out),
                              IPW = get.w(W.out)),
         method = c("matching", "weighting"), 
         var.name = "age", which = "both")

## ---- fig.width=5--------------------------------------------------------
love.plot(bal.tab(treat ~ covs0, data = lalonde, 
                  weights = data.frame(Matched = get.w(m.out),
                                       IPW = get.w(W.out)),
                  method = c("matching", "weighting")), var.order = "unadjusted",
          abs = TRUE, colors = c("red", "blue", "darkgreen"), 
          shapes = c("circle", "square", "triangle"))

## ------------------------------------------------------------------------
ctrl.data <- lalonde[lalonde$treat == 0,]
ctrl.fit <- glm(re78 ~ age + educ + race + 
                    married + nodegree + re74 + re75,
                data = ctrl.data)
lalonde$prog.score <- predict(ctrl.fit, lalonde)

bal.tab(m.out, distance = lalonde["prog.score"])

## ---- echo = FALSE, fig.show = 'hold', fig.width = 5, warning=FALSE------
library("twang")
data("lalonde", package = "cobalt") ##If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))
ps.out <- ps(f.build("treat", covs0), data = lalonde, 
             stop.method = "es.max", 
             estimand = "ATT", n.trees = 100, verbose = FALSE)
plot(ps.out, plots = "es", subset = 1)
love.plot(bal.tab(ps.out, stop.method = "es.max"), threshold = .1,
          abs = TRUE, var.order = "u", color = c("red", "blue"), line = TRUE,
          drop.distance = TRUE)

