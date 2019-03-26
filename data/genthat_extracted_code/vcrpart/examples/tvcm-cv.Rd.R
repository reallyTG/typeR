library(vcrpart)


### Name: tvcm-assessment
### Title: Model selection utility functions for 'tvcm' objects.
### Aliases: tvcm-assessment prune prune.tvcm prunepath prunepath.tvcm
###   cvloss cvloss.tvcm folds_control oobloss oobloss.tvcm
###   plot.cvloss.tvcm
### Keywords: validation

### ** Examples

## --------------------------------------------------------- #
## Dummy Example:
##
## Model selection for the 'vcrpart_2' data. The example is
## merely a syntax template.
## --------------------------------------------------------- #

## load the data
data(vcrpart_2)

## fit the model
control <- tvcm_control(maxstep = 2L, minsize = 5L, cv = FALSE)
model <- tvcglm(y ~ vc(z1, z2, by = x1) + vc(z1, by = x2),
                data = vcrpart_2, family = gaussian(),
                control = control, subset = 1:75)

## cross-validate 'dfsplit'
cv <- cvloss(model, folds = folds_control(type = "kfold", K = 2, seed = 1))
cv
plot(cv)

## prune model with estimated 'cp'
model.p <- prune(model, cp = cv$cp.hat)

## backtrack pruning
prunepath(model.p, steps = 1:3)

## out-of-bag error
oobloss(model, newdata = vcrpart_2[76:100,])

## use an alternative loss function
rfun <- function(y, mu, wt) sum(abs(y - mu))
oobloss(model, newdata = vcrpart_2[76:100,], fun = rfun)



