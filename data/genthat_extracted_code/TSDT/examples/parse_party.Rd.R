library(TSDT)


### Name: parse_party
### Title: parse_party
### Aliases: parse_party

### ** Examples

requireNamespace( "party", quietly = TRUE )
requireNamespace( "modeltools", quietly = TRUE )
## From party::ctree() examples:
set.seed(290875)
## regression
airq <- subset(airquality, !is.na(Ozone))
airct <- party::ctree(Ozone ~ ., data = airq, 
               controls = party::ctree_control(maxsurrogate = 3))

## Parse the results into a new data.frame
ex1 <- parse_party( airct )
ex1

## From party::mob() examples:
data("BostonHousing", package = "mlbench")
## and transform variables appropriately (for a linear regression)
BostonHousing$lstat <- log(BostonHousing$lstat)
BostonHousing$rm <- BostonHousing$rm^2
## as well as partitioning variables (for fluctuation testing)
BostonHousing$chas <- factor( BostonHousing$chas, levels = 0:1, 
                              labels = c("no", "yes") )
BostonHousing$rad <- factor(BostonHousing$rad, ordered = TRUE)

## partition the linear regression model medv ~ lstat + rm
## with respect to all remaining variables:
fmBH <- party::mob( medv ~ lstat + rm | zn + indus + chas + nox + age + 
             dis + rad + tax + crim + b + ptratio,
             control = party::mob_control(minsplit = 40), data = BostonHousing, 
             model = modeltools::linearModel )

## Parse the results into a new data.frame
ex2 <- parse_party( fmBH )
ex2



