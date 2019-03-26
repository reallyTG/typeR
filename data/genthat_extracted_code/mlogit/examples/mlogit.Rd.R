library(mlogit)


### Name: mlogit
### Title: Multinomial logit model
### Aliases: mlogit print.mlogit suml fitted.mlogit predict.mlogit
###   residuals.mlogit df.residual.mlogit terms.mlogit model.matrix.mlogit
###   coef.mlogit update.mlogit summary.mlogit coef.summary.mlogit
###   print.summary.mlogit logLik.mlogit
### Keywords: regression

### ** Examples


## Cameron and Trivedi's Microeconometrics p.493 There are two
## alternative specific variables : price and catch one individual
## specific variable (income) and four fishing mode : beach, pier, boat,
## charter

data("Fishing", package = "mlogit")
Fish <- mlogit.data(Fishing, varying = c(2:9), shape = "wide", choice = "mode")

## a pure "conditional" model

summary(mlogit(mode ~ price + catch, data = Fish))

## a pure "multinomial model"

summary(mlogit(mode ~ 0 | income, data = Fish))

## which can also be estimated using multinom (package nnet)

library("nnet")
summary(multinom(mode ~ income, data = Fishing))

## a "mixed" model

m <- mlogit(mode ~ price+ catch | income, data = Fish)
summary(m)

## same model with charter as the reference level

m <- mlogit(mode ~ price+ catch | income, data = Fish, reflevel = "charter")

## same model with a subset of alternatives : charter, pier, beach

m <- mlogit(mode ~ price+ catch | income, data = Fish,
            alt.subset = c("charter", "pier", "beach"))

## model on unbalanced data i.e. for some observations, some
## alternatives are missing

# a data.frame in wide format with two missing prices
Fishing2 <- Fishing
Fishing2[1, "price.pier"] <- Fishing2[3, "price.beach"] <- NA
mlogit(mode~price+catch|income, Fishing2, shape="wide", choice="mode", varying = 2:9)

# a data.frame in long format with three missing lines
data("TravelMode", package = "AER")
Tr2 <- TravelMode[-c(2, 7, 9),]
mlogit(choice~wait+gcost|income+size, Tr2, shape = "long",
       chid.var = "individual", alt.var="mode", choice = "choice")

## An heteroscedastic logit model

data("TravelMode", package = "AER")
hl <- mlogit(choice ~ wait + travel + vcost, TravelMode,
             shape = "long", chid.var = "individual", alt.var = "mode",
             method = "bfgs", heterosc = TRUE, tol = 10)

## A nested logit model

TravelMode$avincome <- with(TravelMode, income * (mode == "air"))
TravelMode$time <- with(TravelMode, travel + wait)/60
TravelMode$timeair <- with(TravelMode, time * I(mode == "air"))
TravelMode$income <- with(TravelMode, income / 10)

# Hensher and Greene (2002), table 1 p.8-9 model 5
TravelMode$incomeother <- with(TravelMode, ifelse(mode %in% c('air', 'car'), income, 0))
nl <- mlogit(choice~gcost+wait+incomeother, TravelMode,
             shape='long', alt.var='mode',
             nests=list(public=c('train', 'bus'), other=c('car','air')))

# same with a comon nest elasticity (model 1)
nl2 <- update(nl, un.nest.el = TRUE)

## a probit model
## Not run: 
##D pr <- mlogit(choice ~ wait + travel + vcost, TravelMode,
##D              shape = "long", chid.var = "individual", alt.var = "mode",
##D              probit = TRUE)
## End(Not run)


## a mixed logit model
## Not run: 
##D rpl <- mlogit(mode ~ price+ catch | income, Fishing, varying = 2:9,
##D               shape = 'wide', rpar = c(price= 'n', catch = 'n'),
##D               correlation = TRUE, halton = NA,
##D               R = 10, tol = 10, print.level = 0)
##D summary(rpl)
##D rpar(rpl)
##D cor.mlogit(rpl)
##D cov.mlogit(rpl)
##D rpar(rpl, "catch")
##D summary(rpar(rpl, "catch"))
## End(Not run)

# a ranked ordered model
data("Game", package = "mlogit")
g <- mlogit(ch~own|hours, Game, choice='ch', varying = 1:12,
            ranked=TRUE, shape="wide", reflevel="PC")





