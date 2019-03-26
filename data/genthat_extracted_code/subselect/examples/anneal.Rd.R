library(subselect)


### Name: anneal
### Title: Simulated Annealing Search for an optimal k-variable subset
### Aliases: anneal
### Keywords: manip

### ** Examples


## --------------------------------------------------------------------

##
## (1) For illustration of use, a small data set with very few iterations
## of the algorithm, using the RM criterion.
##

data(swiss)
anneal(cor(swiss),2,3,nsol=4,niter=10,criterion="RM")

##$subsets
##, , Card.2
##
##           Var.1 Var.2 Var.3
##Solution 1     3     6     0
##Solution 2     4     5     0
##Solution 3     1     2     0
##Solution 4     3     6     0
##
##, , Card.3
##
##           Var.1 Var.2 Var.3
##Solution 1     4     5     6
##Solution 2     3     5     6
##Solution 3     3     4     6
##Solution 4     4     5     6
##
##
##$values
##              card.2    card.3
##Solution 1 0.8016409 0.9043760
##Solution 2 0.7982296 0.8769672
##Solution 3 0.7945390 0.8777509
##Solution 4 0.8016409 0.9043760
##
##$bestvalues
##   Card.2    Card.3 
##0.8016409 0.9043760 
##
##$bestsets
##       Var.1 Var.2 Var.3
##Card.2     3     6     0
##Card.3     4     5     6
##
##$call
##anneal(cor(swiss), 2, 3, nsol = 4, niter = 10, criterion = "RM")

## --------------------------------------------------------------------

##
## (2) An example excluding variable number 6 from the subsets.
## 

data(swiss)
anneal(cor(swiss),2,3,nsol=4,niter=10,criterion="RM",exclude=c(6))

##$subsets
##, , Card.2
##
##           Var.1 Var.2 Var.3
##Solution 1     4     5     0
##Solution 2     4     5     0
##Solution 3     4     5     0
##Solution 4     4     5     0
##
##, , Card.3
##
##           Var.1 Var.2 Var.3
##Solution 1     1     2     5
##Solution 2     1     2     5
##Solution 3     1     2     5
##Solution 4     1     4     5
##
##
##$values
##              card.2    card.3
##Solution 1 0.7982296 0.8791856
##Solution 2 0.7982296 0.8791856
##Solution 3 0.7982296 0.8791856
##Solution 4 0.7982296 0.8686515
##
##$bestvalues
##   Card.2    Card.3 
##0.7982296 0.8791856 
##
##$bestsets
##       Var.1 Var.2 Var.3
##Card.2     4     5     0
##Card.3     1     2     5
##
##$call
##anneal(cor(swiss), 2, 3, nsol = 4, niter = 10, criterion = "RM",
##     exclude=c(6))

## --------------------------------------------------------------------

## (3) An example specifying initial solutions: using the subsets produced
## by simulated annealing for one criterion (RM, by default) as initial
## solutions for the simulated annealing search with a different criterion.

data(swiss)
rmresults<-anneal(cor(swiss),2,3,nsol=4,niter=10, setseed=TRUE)
anneal(cor(swiss),2,3,nsol=4,niter=10,criterion="gcd",
initialsol=rmresults$subsets)

##$subsets
##, , Card.2
##
##           Var.1 Var.2 Var.3
##Solution 1     3     6     0
##Solution 2     3     6     0
##Solution 3     3     6     0
##Solution 4     3     6     0
##
##, , Card.3
##
##           Var.1 Var.2 Var.3
##Solution 1     4     5     6
##Solution 2     4     5     6
##Solution 3     3     4     6
##Solution 4     4     5     6
##
##
##$values
##              card.2   card.3
##Solution 1 0.8487026 0.925372
##Solution 2 0.8487026 0.925372
##Solution 3 0.8487026 0.798864
##Solution 4 0.8487026 0.925372
##
##$bestvalues
##   Card.2    Card.3 
##0.8487026 0.9253720 
##
##$bestsets
##       Var.1 Var.2 Var.3
##Card.2     3     6     0
##Card.3     4     5     6
##
##$call
##anneal(cor(swiss), 2, 3, nsol = 4, niter = 10, criterion = "gcd", 
##    initialsol = rmresults$subsets)

## --------------------------------------------------------------------

## (4) An example of subset selection in the context of Multiple Linear
## Regression. Variable 5 (average car price) in the Cars93 MASS library 
## data set is regressed on 13 other variables.  A best subset of linear 
## predictors is sought, using the "TAU_2" criterion which, in the case 
## of a Linear Regression, is merely  the standard Coefficient of Determination, 
## R^2 (like the other three criteria for the multivariate linear hypothesis, 
## "XI_2", "CCR1_2" and "ZETA_2"). 

library(MASS)
data(Cars93)
CarsHmat <- lmHmat(Cars93[,c(7:8,12:15,17:22,25)],Cars93[,5])

names(Cars93[,5,drop=FALSE])
##  [1] "Price"

colnames(CarsHmat$mat)

##  [1] "MPG.city"           "MPG.highway"        "EngineSize"        
##  [4] "Horsepower"         "RPM"                "Rev.per.mile"      
##  [7] "Fuel.tank.capacity" "Passengers"         "Length"            
## [10] "Wheelbase"          "Width"              "Turn.circle"       
## [13] "Weight"            

anneal(CarsHmat$mat, kmin=4, kmax=6, H=CarsHmat$H, r=1, crit="tau2")

## $subsets
## , , Card.4
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     4     5    10    11     0     0
## 
## , , Card.5
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     4     5    10    11    12     0
## 
## , , Card.6
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     4     5     9    10    11    12
## 
## 
## $values
##               card.4    card.5   card.6
## Solution 1 0.7143794 0.7241457 0.731015
## 
## $bestvalues
##    Card.4    Card.5    Card.6 
## 0.7143794 0.7241457 0.7310150 
## 
## $bestsets
##        Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Card.4     4     5    10    11     0     0
## Card.5     4     5    10    11    12     0
## Card.6     4     5     9    10    11    12
## 
## $call
## anneal(mat = CarsHmat$mat, kmin = 4, kmax = 6, criterion = "xi2", 
##     H = CarsHmat$H, r = 1)
##

## --------------------------------------------------------------------

## (5) A Linear Discriminant Analysis example with a very small data set. 
## We consider the Iris data and three groups, defined by species (setosa, 
## versicolor and virginica). The goal is to select the 2- and 3-variable
## subsets that are optimal for the linear discrimination (as measured 
## by the "CCR1_2" criterion).

 
data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
anneal(irisHmat$mat,kmin=2,kmax=3,H=irisHmat$H,r=2,crit="ccr12")

## $subsets
## , , Card.2
## 
##            Var.1 Var.2 Var.3
## Solution 1     1     3     0
## 
## , , Card.3
## 
##            Var.1 Var.2 Var.3
## Solution 1     2     3     4
## 
## 
## $values
##               card.2   card.3
## Solution 1 0.9589055 0.967897
## 
## $bestvalues
##    Card.2    Card.3 
## 0.9589055 0.9678971 
## 
## $bestsets
##        Var.1 Var.2 Var.3
## Card.2     1     3     0
## Card.3     2     3     4
## 
## $call
## anneal(irisHmat$mat,kmin=2,kmax=3,H=irisHmat$H,r=2,crit="ccr12")
## 

## --------------------------------------------------------------------

## (6) An example of subset selection in the context of a Canonical
## Correlation Analysis. Two groups of variables within the Cars93
## MASS library data set are compared. The goal is to select 4- to
## 6-variable subsets of the 13-variable 'X' group that are optimal in
## terms of preserving the canonical correlations, according to the
## "XI_2" criterion (Warning: the 3-variable 'Y' group is kept
## intact; subset selection is carried out in the 'X' 
## group only). The 'tolsym' parameter is used to relax the symmetry
## requirements on the effect matrix H which, for numerical reasons,
## is slightly asymmetric. Since corresponding off-diagonal entries of
## matrix H are different, but by less than tolsym, H is replaced  
## by its symmetric part: (H+t(H))/2.

library(MASS)
data(Cars93)
CarsHmat <- lmHmat(Cars93[,c(7:8,12:15,17:22,25)],Cars93[,4:6])

names(Cars93[,4:6])
## [1] "Min.Price" "Price"     "Max.Price"

colnames(CarsHmat$mat)

##  [1] "MPG.city"           "MPG.highway"        "EngineSize"        
##  [4] "Horsepower"         "RPM"                "Rev.per.mile"      
##  [7] "Fuel.tank.capacity" "Passengers"         "Length"            
## [10] "Wheelbase"          "Width"              "Turn.circle"       
## [13] "Weight"            

anneal(CarsHmat$mat, kmin=4, kmax=6, H=CarsHmat$H, r=CarsHmat$r,
crit="tau2" , tolsym=1e-9)

## $subsets
## , , Card.4
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     4     9    10    11     0     0
## 
## , , Card.5
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4     9    10    11     0
## 
## , , Card.6
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4     5     9    10    11
## 
## 
## $values
##               card.4    card.5    card.6
## Solution 1 0.2818772 0.2943742 0.3057831
## 
## $bestvalues
##    Card.4    Card.5    Card.6 
## 0.2818772 0.2943742 0.3057831 
## 
## $bestsets
##        Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Card.4     4     9    10    11     0     0
## Card.5     3     4     9    10    11     0
## Card.6     3     4     5     9    10    11
## 
## $call
## anneal(mat = CarsHmat$mat, kmin = 4, kmax = 6, criterion = "xi2", 
##     H = CarsHmat$H, r = CarsHmat$r, tolsym = 1e-09)
## 
## Warning message:
## 
##  The effect description matrix (H) supplied was slightly asymmetric: 
##  symmetric entries differed by up to 3.63797880709171e-12.
##  (less than the 'tolsym' parameter).
##  The H matrix has been replaced by its symmetric part.
##  in: validnovcrit(mat, criterion, H, r, p, tolval, tolsym) 

## --------------------------------------------------------------------

##  (7) An example of variable selection in the context of a logistic 
##  regression model. We consider the last 100 observations of
##  the iris data set (versicolor and verginica species) and try
##  to find the best variable subsets for the model that takes species
##  as response variable.

data(iris)
iris2sp <- iris[iris$Species != "setosa",]
logrfit <- glm(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
iris2sp,family=binomial)
Hmat <- glmHmat(logrfit)
anneal(Hmat$mat,1,3,H=Hmat$H,r=1,criterion="Wald")

## $subsets
## , , Card.1
##
##           Var.1 Var.2 Var.3
## Solution 1     4     0     0

## , , Card.2

##            Var.1 Var.2 Var.3
## Solution 1     1     3     0

## , , Card.3

##            Var.1 Var.2 Var.3
## Solution 1     2     3     4


## $values
##              card.1   card.2   card.3
## Solution 1 4.894554 3.522885 1.060121

## $bestvalues
##   Card.1   Card.2   Card.3 
## 4.894554 3.522885 1.060121 

## $bestsets
##        Var.1 Var.2 Var.3
## Card.1     4     0     0
## Card.2     1     3     0
## Card.3     2     3     4

## $call
## anneal(mat = Hmat$mat, kmin = 1, kmax = 3, criterion = "Wald", 
##     H = Hmat$H, r = 1)
## --------------------------------------------------------------------

## It should be stressed that, unlike other criteria in the
## subselect package, the Wald criterion is not bounded above by
## 1 and is a decreasing function of subset quality, so that the
## 3-variable subsets do, in fact, perform better than their smaller-sized
## counterparts.




