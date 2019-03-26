library(Formula)


### Name: model.frame.Formula
### Title: Model Frame/Matrix/Response Construction for Extended Formulas
### Aliases: terms.Formula model.matrix.Formula model.frame.Formula
###   model.part model.part.formula model.part.Formula
### Keywords: models

### ** Examples

## artificial example data
set.seed(1090)
dat <- as.data.frame(matrix(round(runif(21), digits = 2), ncol = 7))
colnames(dat) <- c("y1", "y2", "y3", "x1", "x2", "x3", "x4")
for(i in c(2, 6:7)) dat[[i]] <- factor(dat[[i]] > 0.5, labels = c("a", "b"))
dat$y2[1] <- NA
dat

######################################
## single response and two-part RHS ##
######################################

## single response with two-part RHS
F1 <- Formula(log(y1) ~ x1 + x2 | I(x1^2))
length(F1)

## set up model frame
mf1 <- model.frame(F1, data = dat)
mf1

## extract single response
model.part(F1, data = mf1, lhs = 1, drop = TRUE)
model.response(mf1)
## model.response() works as usual

## extract model matrices
model.matrix(F1, data = mf1, rhs = 1)
model.matrix(F1, data = mf1, rhs = 2)

#########################################
## multiple responses and multiple RHS ##
#########################################

## set up Formula
F2 <- Formula(y1 + y2 | log(y3) ~ x1 + I(x2^2) | 0 + log(x1) | x3 / x4)
length(F2)

## set up full model frame
mf2 <- model.frame(F2, data = dat)
mf2

## extract responses
model.part(F2, data = mf2, lhs = 1)
model.part(F2, data = mf2, lhs = 2)
## model.response(mf2) does not give correct results!

## extract model matrices
model.matrix(F2, data = mf2, rhs = 1)
model.matrix(F2, data = mf2, rhs = 2)
model.matrix(F2, data = mf2, rhs = 3)

#######################
## Formulas with '.' ##
#######################

## set up Formula with a single '.'
F3 <- Formula(y1 | y2 ~ .)
mf3 <- model.frame(F3, data = dat)
## without y1 or y2
model.matrix(F3, data = mf3)
## without y1 but with y2
model.matrix(F3, data = mf3, lhs = 1)
## without y2 but with y1
model.matrix(F3, data = mf3, lhs = 2)

## set up Formula with multiple '.'
F3 <- Formula(y1 | y2 | log(y3) ~ . - x3 - x4 | .)
## process both '.' separately (default)
mf3 <- model.frame(F3, data = dat, dot = "separate")
## only x1-x2
model.part(F3, data = mf3, rhs = 1)
## all x1-x4
model.part(F3, data = mf3, rhs = 2)

## process the '.' sequentially, i.e., the second RHS conditional on the first
mf3 <- model.frame(F3, data = dat, dot = "sequential")
## only x1-x2
model.part(F3, data = mf3, rhs = 1)
## only x3-x4
model.part(F3, data = mf3, rhs = 2)

## process the second '.' using the previous RHS element
mf3 <- model.frame(F3, data = dat, dot = "previous")
## only x1-x2
model.part(F3, data = mf3, rhs = 1)
## x1-x2 again
model.part(F3, data = mf3, rhs = 2)

##############################
## Process multiple offsets ##
##############################

## set up Formula
F4 <- Formula(y1 ~ x3 + offset(x1) | x4 + offset(log(x2)))
mf4 <- model.frame(F4, data = dat)
## model.part can be applied as above and includes offset!
model.part(F4, data = mf4, rhs = 1)
## additionally, the corresponding corresponding terms can be included
model.part(F4, data = mf4, rhs = 1, terms = TRUE)
## hence model.offset() can be applied to extract offsets
model.offset(model.part(F4, data = mf4, rhs = 1, terms = TRUE))
model.offset(model.part(F4, data = mf4, rhs = 2, terms = TRUE))



