library(cobalt)


### Name: bal.tab.Match
### Title: Balance Statistics for 'Matching', 'optmatch', 'ebal', and
###   'designmatch' Objects
### Aliases: bal.tab.Match bal.tab.optmatch bal.tab.ebalance
###   bal.tab.designmatch

### ** Examples

########## Matching ##########
library(Matching); data("lalonde", package = "cobalt")

p.score <- glm(treat ~ age + educ + race + 
            married + nodegree + re74 + re75, 
            data = lalonde, family = "binomial")$fitted.values
Match.out <- Match(Tr = lalonde$treat, X = p.score)

## Using formula and data
bal.tab(Match.out, treat ~ age + educ + race + 
        married + nodegree + re74 + re75, data = lalonde)

########## optmatch ##########
library("optmatch"); data("lalonde", package = "cobalt")

lalonde$prop.score <- glm(treat ~ age + educ + race + 
            married + nodegree + re74 + re75, 
            data = lalonde, family = binomial)$fitted.values
pm <- pairmatch(treat ~ prop.score, data = lalonde)

## Using formula and data
bal.tab(pm, treat ~ age + educ + race + 
        married + nodegree + re74 + re75, data = lalonde,
        distance = "prop.score")

########## ebal ##########
library("ebal"); data("lalonde", package = "cobalt")

covariates <- subset(lalonde, select = -c(re78, treat, race))
e.out <- ebalance(lalonde$treat, covariates)

## Using treat and covs
bal.tab(e.out, treat = lalonde$treat, covs = covariates)

## Not run: 
##D ########## designmatch ##########
##D library("designmatch"); data("lalonde", package = "cobalt")
##D 
##D covariates <- as.matrix(lalonde[c("age", "educ", "re74", "re75")])
##D dmout <- bmatch(lalonde$treat,
##D                 total_groups = sum(lalonde$treat == 1),
##D                 mom = list(covs = covariates,
##D                            tols = absstddif(covs, treat, .05))
##D                 )
##D 
##D ## Using treat and covs
##D bal.tab(dmout, treat = lalonde$treat, covs = covariates)
## End(Not run)



