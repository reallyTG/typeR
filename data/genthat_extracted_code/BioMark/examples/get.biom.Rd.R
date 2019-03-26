library(BioMark)


### Name: get.biom
### Title: Get biomarkers discriminating between two classes
### Aliases: get.biom print.BMark summary.BMark coef.BMark
### Keywords: multivariate models htest

### ** Examples

## Real apple data (small set)
data(spikedApples)
apple.coef <- get.biom(X = spikedApples$dataMatrix,
                       Y = factor(rep(1:2, each = 10)),
                       ncomp = 2:3, type = "coef")
coef.sizes <- coef(apple.coef) 
sapply(coef.sizes, range)

## stability-based selection
set.seed(17)
apple.stab <- get.biom(X = spikedApples$dataMatrix,
                       Y = factor(rep(1:2, each = 10)),
                       ncomp = 2:3, type = "stab")
selected.variables <- selection(apple.stab)
unlist(sapply(selected.variables, function(x) sapply(x, length)))
## Ranging from more than 70 for pcr, approx 40 for pls and student t,
## to 0-29 for the lasso
unlist(sapply(selected.variables,
              function(x) lapply(x, function(xx, y) sum(xx %in% y),
              spikedApples$biom)))
## TPs (stab): all find 5/5, except pcr.2 and the lasso with values for lambda
## larger than 0.0484

unlist(sapply(selected.variables,
              function(x) lapply(x, function(xx, y) sum(!(xx %in% y)),
              spikedApples$biom)))
## FPs (stab): PCR finds most FPs (approx. 60), other latent-variable
## methods approx 40, lasso allows for the optimal selection around 
## lambda = 0.0702

## regression example
data(gasoline) ## from the pls package
gasoline.stab <- get.biom(gasoline$NIR, gasoline$octane,
                          fmethod = c("pcr", "pls", "lasso"), type = "stab")


## Not run: 
##D ## Same for HC-based selection
##D ## Warning: takes a long time!
##D apple.HC <- get.biom(X = spikedApples$dataMatrix,
##D                      Y = factor(rep(1:2, each = 10)),
##D                      ncomp = 2:3, type = "HC")
##D sapply(apple.HC[names(apple.HC) != "info"],
##D        function(x, y) sum(x$biom.indices %in% y),
##D        spikedApples$biom)
##D sapply(apple.HC[names(apple.HC) != "info"],
##D        function(x, y) sum(!(x$biom.indices %in% y)),
##D        spikedApples$biom)
## End(Not run)



