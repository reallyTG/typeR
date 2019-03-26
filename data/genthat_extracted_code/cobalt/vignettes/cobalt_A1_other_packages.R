## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(message = FALSE)
library("cobalt")

## ------------------------------------------------------------------------
data("lalonde", package = "cobalt")
covs <- subset(lalonde, select = -c(treat, re78))
f.build("treat", covs)

## ---- eval = FALSE-------------------------------------------------------
#  # Generating propensity scores using logistic regression
#  p.score <- glm(f.build("treat", covs), data = lalonde, family = "binomial")$fitted.values
#  
#  # Using matchit() from the MatchIt package
#  library("MatchIt")
#  m.out <- matchit(f.build("treat", covs), data = lalonde, method = "nearest")

## ------------------------------------------------------------------------
head(lalonde)
lalonde.split <- splitfactor(lalonde, "race")
head(lalonde.split)

## ------------------------------------------------------------------------
lalonde.unsplit <- unsplitfactor(lalonde.split, "race", 
                                 dropped.level = "black")
head(lalonde.unsplit)

## ---- include=FALSE------------------------------------------------------
if (!"twang" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ---- warning = FALSE----------------------------------------------------
library("twang")
data("lalonde", package = "cobalt") ##If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

ps.out <- ps(f.build("treat", covs0), data = lalonde, 
             stop.method = c("es.mean", "es.max"), 
             estimand = "ATT", n.trees = 1000, verbose = FALSE)
bal.tab(ps.out, stop.method = "es.mean")

## ---- include=FALSE, eval=TRUE-------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"Matching" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("Matching")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

fit <- glm(f.build("treat", covs0), data = lalonde, family = "binomial")
p.score <- fit$fitted.values
match.out <- Match(Tr = lalonde$treat, X = p.score, estimand = "ATT")

bal.tab(match.out, formula = f.build("treat", covs0), data = lalonde)

## ---- eval = FALSE-------------------------------------------------------
#  bal.tab(match.out, treat = lalonde$treat, covs = covs0)

## ---- include=FALSE, eval=TRUE-------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"optmatch" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
#Optimal full matching on the propensity score
library("optmatch")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

fit <- glm(f.build("treat", covs0), data = lalonde, family = "binomial")
lalonde$p.score <- fit$fitted.values #get the propensity score
fm <- fullmatch(treat ~ p.score, data = lalonde)

bal.tab(fm, formula = f.build("treat", covs0), data = lalonde)

## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"CBPS" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("CBPS")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, nodegree, married))

#Generating covariate balancing propensity score weights for ATT
cbps.out <- CBPS(f.build("treat", covs0), data = lalonde)

bal.tab(cbps.out)

## ---- include=FALSE, eval=TRUE-------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"ebal" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("ebal")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, race))

#Generating entropy balancing weights
e.out <- ebalance(lalonde$treat, covs0)

bal.tab(e.out, treat = lalonde$treat, covs = covs0)

## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"designmatch" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("designmatch")
data("lalonde", package = "cobalt") #If not yet loaded
covs0 <- subset(lalonde, select = -c(treat, re78, race))

#Matching for balance on covariates
dmout <- bmatch(lalonde$treat,
                dist_mat = NULL,
                subset_weight = NULL,
                mom = list(covs = covs0,
                           tols = absstddif(covs0, lalonde$treat, .005)),
                n_controls = 1,
                total_groups = 185)

bal.tab(dmout, treat = lalonde$treat, covs = covs0)

## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

## ---- include=FALSE------------------------------------------------------
if (!"optweight" %in% rownames(installed.packages())) knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library("optweight")
data("lalonde", package = "cobalt")

#Estimate the weights using optimization
ow.out <- optweight(treat ~ age + educ + married + race + re74 + re75,
                    data = lalonde, estimand = "ATE", tols = .01)

#Note the contents of the output object:
names(ow.out)

#Use bal.tab() directly on the output
bal.tab(ow.out)

## ---- include=FALSE------------------------------------------------------
knitr::opts_chunk$set(eval = TRUE)

