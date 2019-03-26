library(subselect)


### Name: improve
### Title: Restricted Local Improvement search for an optimal k-variable
###   subset
### Aliases: improve
### Keywords: manip

### ** Examples


## --------------------------------------------------------------------

##
## 1) For illustration of use, a small data set with very few iterations
## of the algorithm. 
## Subsets of 2 and of 3 variables are sought using the RM criterion.
##

data(swiss)
improve(cor(swiss),2,3,nsol=4,criterion="GCD")
## $subsets
## , , Card.2
##
##            Var.1 Var.2 Var.3
## Solution 1     3     6     0
## Solution 2     3     6     0
## Solution 3     3     6     0
## Solution 4     3     6     0
##
## , , Card.3
##
##            Var.1 Var.2 Var.3
## Solution 1     4     5     6
## Solution 2     4     5     6
## Solution 3     4     5     6
## Solution 4     4     5     6
##
##
## $values
##               card.2   card.3
## Solution 1 0.8487026 0.925372
## Solution 2 0.8487026 0.925372
## Solution 3 0.8487026 0.925372
## Solution 4 0.8487026 0.925372
##
## $bestvalues
##    Card.2    Card.3 
## 0.8487026 0.9253720 
##
## $bestsets
##        Var.1 Var.2 Var.3
## Card.2     3     6     0
## Card.3     4     5     6
##
##$call
##improve(cor(swiss), 2, 3, nsol = 4, criterion = "GCD")


## --------------------------------------------------------------------

##
## 2) Forcing the inclusion of variable 1 in the subset
##

 improve(cor(swiss),2,3,nsol=4,criterion="GCD",include=c(1))

## $subsets
## , , Card.2
##
##            Var.1 Var.2 Var.3
## Solution 1     1     6     0
## Solution 2     1     6     0
## Solution 3     1     6     0
## Solution 4     1     6     0
##
## , , Card.3
##
##            Var.1 Var.2 Var.3
## Solution 1     1     5     6
## Solution 2     1     5     6
## Solution 3     1     5     6
## Solution 4     1     5     6
##
##
## $values
##               card.2    card.3
## Solution 1 0.7284477 0.8048528
## Solution 2 0.7284477 0.8048528
## Solution 3 0.7284477 0.8048528
## Solution 4 0.7284477 0.8048528
##
## $bestvalues
##    Card.2    Card.3 
## 0.7284477 0.8048528 
##
## $bestsets
##        Var.1 Var.2 Var.3
## Card.2     1     6     0
## Card.3     1     5     6
##
##$call
##improve(cor(swiss), 2, 3, nsol = 4, criterion = "GCD", include = c(1))

## --------------------------------------------------------------------

## 3) An example of subset selection in the context of Multiple Linear
## Regression. Variable 5 (average car price) in the Cars93 MASS library 
## data set is regressed on 13 other variables. Three variable subsets of 
## cardinalities 4, 5 and 6 are requested, using the "XI_2" criterion which, 
## in the case of a Linear Regression, is merely  the standard Coefficient of
## Determination, R^2 (as are the other three criteria for the
## multivariate linear hypothesis, "TAU_2", "CCR1_2" and "ZETA_2").

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


improve(CarsHmat$mat, kmin=4, kmax=6, H=CarsHmat$H, r=1, crit="xi2", nsol=3)

## $subsets
## , , Card.4
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4    11    13     0     0
## Solution 2     3     4    11    13     0     0
## Solution 3     4     5    10    11     0     0
## 
## , , Card.5
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4     8    11    13     0
## Solution 2     4     5    10    11    12     0
## Solution 3     4     5    10    11    12     0
## 
## , , Card.6
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     4     5     6    10    11    12
## Solution 2     4     5     8    10    11    12
## Solution 3     4     5     9    10    11    12
## 
## 
## $values
##               card.4    card.5    card.6
## Solution 1 0.6880773 0.6899182 0.7270257
## Solution 2 0.6880773 0.7241457 0.7271056
## Solution 3 0.7143794 0.7241457 0.7310150
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
## improve(mat = CarsHmat$mat, kmin = 4, kmax = 6, nsol = 3, criterion = "xi2", 
##     H = CarsHmat$H, r = 1)



## --------------------------------------------------------------------

## 4) A Linear Discriminant Analysis example with a very small data set. 
## We consider the Iris data and three groups, defined by species (setosa, 
## versicolor and virginica). The goal is to select the 2- and 3-variable
## subsets that are optimal for the linear discrimination (as measured 
## by the "TAU_2" criterion).

data(iris)
irisHmat <- ldaHmat(iris[1:4],iris$Species)
improve(irisHmat$mat,kmin=2,kmax=3,H=irisHmat$H,r=2,crit="ccr12")

## $subsets
## , , Card.2
## 
##            Var.1 Var.2 Var.3
## Solution 1     2     3     0
## 
## , , Card.3
## 
##            Var.1 Var.2 Var.3
## Solution 1     2     3     4
## 
## 
## $values
##               card.2    card.3
## Solution 1 0.8079476 0.8419635
## 
## $bestvalues
##    Card.2    Card.3 
## 0.8079476 0.8419635 
## 
## $bestsets
##        Var.1 Var.2 Var.3
## Card.2     2     3     0
## Card.3     2     3     4
## 
## $call
## improve(mat = irisHmat$mat, kmin = 2, kmax = 3, 
##     criterion = "tau2", H = irisHmat$H, r = 2)
## 

## --------------------------------------------------------------------

## 5) An example of subset selection in the context of a Canonical
## Correlation Analysis. Two groups of variables within the Cars93
## MASS library data set are compared. The goal is to select 4- to
## 6-variable subsets of the 13-variable 'X' group that are optimal in
## terms of preserving the canonical correlations, according to the
## "ZETA_2" criterion (Warning: the 3-variable 'Y' group is kept
## intact; subset selection is carried out in the 'X' 
## group only).  The 'tolsym' parameter is used to relax the symmetry
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


improve(CarsHmat$mat, kmin=4, kmax=6, H=CarsHmat$H, r=3, crit="zeta2", tolsym=1e-9)

## $subsets
## , , Card.4
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4    11    13     0     0
## 
## , , Card.5
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4     9    11    13     0
## 
## , , Card.6
## 
##            Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1     3     4     5     9    10    11
## 
## 
## $values
##               card.4    card.5    card.6
## Solution 1 0.4626035 0.4875495 0.5071096
## 
## $bestvalues
##    Card.4    Card.5    Card.6 
## 0.4626035 0.4875495 0.5071096 
## 
## $bestsets
##        Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Card.4     3     4    11    13     0     0
## Card.5     3     4     9    11    13     0
## Card.6     3     4     5     9    10    11
## 
## $call
## improve(mat = CarsHmat$mat, kmin = 4, kmax = 6, criterion = "zeta2", 
##     H = CarsHmat$H, r = 3, tolsym = 1e-09)
## 
## Warning message:
## 
##  The effect description matrix (H) supplied was slightly asymmetric: 
##  symmetric entries differed by up to 3.63797880709171e-12.
##  (less than the 'tolsym' parameter).
##  The H matrix has been replaced by its symmetric part.
##  in: validnovcrit(mat, criterion, H, r, p, tolval, tolsym) 

## --------------------------------------------------------------------

##  6) An example of variable selection in the context of a logistic 
##  regression model. We consider the last 100 observations of
##  the iris data set (versicolor and verginica species) and try
##  to find the best variable subsets for the model that takes species
##  as response variable.

data(iris)
iris2sp <- iris[iris$Species != "setosa",]
logrfit <- glm(Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width,
iris2sp,family=binomial)
Hmat <- glmHmat(logrfit)
improve(Hmat$mat,1,3,H=Hmat$H,r=1,criterion="Wald")

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
## improve(mat = Hmat$mat, kmin = 1, kmax = 3, criterion = "Wald", 
##     H = Hmat$H, r = 1)
## --------------------------------------------------------------------

## It should be stressed that, unlike other criteria in the
## subselect package, the Wald criterion is not bounded above by
## 1 and is a decreasing function of subset quality, so that the
## 3-variable subsets do, in fact, perform better than their smaller-sized
## counterparts.




