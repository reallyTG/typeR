library(subselect)


### Name: glmHmat
### Title: Input matrices for subselect search routines in generalized
###   linear models
### Aliases: glmHmat glmHmat.glm
### Keywords: manip

### ** Examples

##----------------------------------------------------------------

##----------------------------------------------------------------

##  An example of variable selection in the context of binary response 
##  regression models. We consider the last 100 observations of
##  the iris data set (versicolor an verginica species) and try
##  to find the best variable subsets for models that take species
##  as the response variable.

data(iris)
iris2sp <- iris[iris$Species != "setosa",]

# Create the input matrices for the  search routines in a logistic regression model 

modelfit <- glm(Species ~ Sepal.Length + Sepal.Width + Petal.Length +
Petal.Width,iris2sp,family=binomial) 
Hmat <- glmHmat(modelfit)
Hmat

## $mat
##              Sepal.Length Sepal.Width Petal.Length Petal.Width
## Sepal.Length  0.28340358 0.03263437  0.09552821  -0.01779067
## Sepal.Width   0.03263437 0.13941541  0.01086596 0.04759284
## Petal.Length  0.09552821 0.01086596  0.08847655  -0.01853044
## Petal.Width   -0.01779067 0.04759284  -0.01853044 0.03258730

## $H
##              Sepal.Length  Sepal.Width Petal.Length  Petal.Width
## Sepal.Length   0.11643732  0.013349227 -0.063924853 -0.050181400
## Sepal.Width    0.01334923  0.001530453 -0.007328813 -0.005753163
## Petal.Length  -0.06392485 -0.007328813  0.035095164  0.027549918
## Petal.Width   -0.05018140 -0.005753163  0.027549918  0.021626854

## $r
## [1] 1

## $call
## glmHmat(fitdglmmodel = modelfit)

# Search for the 3 best variable subsets of each dimensionality by an exausitve search 

eleaps(Hmat$mat,H=Hmat$H,r=1,criterion="Wald",nsol=3)

## $subsets
## , , Card.1

##            Var.1 Var.2 Var.3
## Solution 1     4     0     0
## Solution 2     1     0     0
## Solution 3     3     0     0

## , , Card.2

##           Var.1 Var.2 Var.3
## Solution 1     1     3     0
## Solution 2     3     4     0
## Solution 3     2     4     0

## , , Card.3

##            Var.1 Var.2 Var.3
## Solution 1     2     3     4
## Solution 2     1     3     4
## Solution 3     1     2     3


## $values
##              card.1   card.2   card.3
## Solution 1 4.894554 3.522885 1.060121
## Solution 2 5.147360 3.952538 2.224335
## Solution 3 5.161553 3.972410 3.522879

## $bestvalues
##   Card.1   Card.2   Card.3 
## 4.894554 3.522885 1.060121 

## $bestsets
##        Var.1 Var.2 Var.3
## Card.1     4     0     0
## Card.2     1     3     0
## Card.3     2     3     4

## $call
## eleaps(mat = Hmat$mat, nsol = 3, criterion = "Wald", H = Hmat$H, 
##    r = 1)


## It should be stressed that, unlike other criteria in the
## subselect package, the Wald criterion is not bounded above by
## 1 and is a decreasing function of subset quality, so that the
## 3-variable subsets do, in fact, perform better than their smaller-sized
## counterparts.


## > 
## > proc.time()
## [1] 0.680 0.064 0.736 0.000 0.000



