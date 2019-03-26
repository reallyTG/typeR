library(subselect)


### Name: genetic
### Title: Genetic Algorithm searching for an optimal k-variable subset
### Aliases: genetic
### Keywords: manip

### ** Examples


## --------------------------------------------------------------------

##
## 1) For illustration of use, a small data set with very few iterations
## of the algorithm.  Escoufier's 'RV' criterion is used to select variable
## subsets of size 3 and 4.
##

data(swiss)
genetic(cor(swiss),3,4,popsize=10,nger=5,criterion="Rv")

## For cardinality k=
##[1] 4
## there is not enough genetic diversity in generation number 
##[1] 3
## for acceptable levels of consanguinity (couples differing by at least 2 genes).
## Try reducing the maximum acceptable number  of clones (maxclone) or 
## increasing the population size (popsize)
## Best criterion value found so far:
##[1] 0.9557145
##$subsets
##, , Card.3
##
##            Var.1 Var.2 Var.3 Var.4
##Solution 1      1     2     3     0
##Solution 2      1     2     3     0
##Solution 3      1     2     3     0
##Solution 4      3     4     6     0
##Solution 5      3     4     6     0
##Solution 6      3     4     5     0
##Solution 7      3     4     5     0
##Solution 8      1     3     6     0
##Solution 9      1     3     6     0
##Solution 10     1     3     6     0
##
##, , Card.4
##
##            Var.1 Var.2 Var.3 Var.4
##Solution 1      2     4     5     6
##Solution 2      1     2     5     6
##Solution 3      1     2     3     5
##Solution 4      1     2     4     5
##Solution 5      1     2     4     5
##Solution 6      1     4     5     6
##Solution 7      1     4     5     6
##Solution 8      1     4     5     6
##Solution 9      1     3     4     5
##Solution 10     1     3     4     5
##
##
##$values
##               card.3    card.4
##Solution 1  0.9141995 0.9557145
##Solution 2  0.9141995 0.9485699
##Solution 3  0.9141995 0.9455508
##Solution 4  0.9034868 0.9433203
##Solution 5  0.9034868 0.9433203
##Solution 6  0.9020271 0.9428967
##Solution 7  0.9020271 0.9428967
##Solution 8  0.8988192 0.9428967
##Solution 9  0.8988192 0.9357982
##Solution 10 0.8988192 0.9357982
##
##$bestvalues
##   Card.3    Card.4 
##0.9141995 0.9557145 
##
##$bestsets
##       Var.1 Var.2 Var.3 Var.4
##Card.3     1     2     3     0
##Card.4     2     4     5     6
##
##$call
##genetic(mat = cor(swiss), kmin = 3, kmax = 4, popsize = 10, nger = 5, 
##    criterion = "Rv")



## --------------------------------------------------------------------

##
## 2) An example of subset selection in the context of Multiple Linear
## Regression. Variable 5 (average car price) in the Cars93 MASS library 
## data set is regressed on 13 other variables. The six-variable subsets 
## of linear predictors are chosen using the "CCR1_2" criterion which, 
## in the case of a Linear Regression, is merely  the standard Coefficient 
## of Determination, R^2 (as are the other three criteria for the
## multivariate linear hypothesis, "XI_2", "TAU_2" and "ZETA_2").
##

library(MASS)
data(Cars93)
CarsHmat <- lmHmat(Cars93[,c(7:8,12:15,17:22,25)],Cars93[,5])

names(Cars93[,5,drop=FALSE])
##  [1] "Price"

colnames(CarsHmat)

##  [1] "MPG.city"           "MPG.highway"        "EngineSize"        
##  [4] "Horsepower"         "RPM"                "Rev.per.mile"      
##  [7] "Fuel.tank.capacity" "Passengers"         "Length"            
## [10] "Wheelbase"          "Width"              "Turn.circle"       
## [13] "Weight"            


genetic(CarsHmat$mat, kmin=6,  H=CarsHmat$H, r=1, crit="CCR12")

## 
## (Partial results only)
## 
## $subsets
##             Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1      4     5     9    10    11    12
## Solution 2      4     5     9    10    11    12
## Solution 3      4     5     9    10    11    12
## Solution 4      4     5     9    10    11    12
## Solution 5      4     5     9    10    11    12
## Solution 6      4     5     9    10    11    12
## Solution 7      4     5     8    10    11    12
## 
## (...)
## 
## Solution 94      1     4     5     6    10    11
## Solution 95      1     4     5     6    10    11
## Solution 96      1     4     5     6    10    11
## Solution 97      1     4     5     6    10    11
## Solution 98      1     4     5     6    10    11
## Solution 99      1     4     5     6    10    11
## Solution 100     1     4     5     6    10    11
## 
## $values
##   Solution 1   Solution 2   Solution 3   Solution 4   Solution 5   Solution 6 
##    0.7310150    0.7310150    0.7310150    0.7310150    0.7310150    0.7310150 
##   Solution 7   Solution 8   Solution 9  Solution 10  Solution 11  Solution 12 
##    0.7310150    0.7271056    0.7271056    0.7271056    0.7271056    0.7271056 
##  Solution 13  Solution 14  Solution 15  Solution 16  Solution 17  Solution 18 
##    0.7271056    0.7270257    0.7270257    0.7270257    0.7270257    0.7270257 
## 
## (...)
## 
##  Solution 85  Solution 86  Solution 87  Solution 88  Solution 89  Solution 90 
##    0.7228800    0.7228800    0.7228800    0.7228800    0.7228800    0.7228800 
##  Solution 91  Solution 92  Solution 93  Solution 94  Solution 95  Solution 96 
##    0.7228463    0.7228463    0.7228463    0.7228463    0.7228463    0.7228463 
##  Solution 97  Solution 98  Solution 99 Solution 100 
##    0.7228463    0.7228463    0.7228463    0.7228463 
## 
## $bestvalues
##   Card.6 
## 0.731015 
## 
## $bestsets
## Var.1 Var.2 Var.3 Var.4 Var.5 Var.6 
##     4     5     9    10    11    12 
## 
## $call
## genetic(mat = CarsHmat$mat, kmin = 6, criterion = "CCR12", H = CarsHmat$H, 
##     r = 1)


## --------------------------------------------------------------------

## 3) An example of subset selection in the context of a Canonical
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


genetic(CarsHmat$mat, kmin=5, kmax=6, H=CarsHmat$H, r=3, crit="zeta2", tolsym=1e-9)

##  (PARTIAL RESULTS ONLY)
## 
## $subsets
##
##             Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Solution 1      4     5     9    10    11     0
## Solution 2      4     5     9    10    11     0
## Solution 3      4     5     9    10    11     0
## Solution 4      4     5     9    10    11     0
## Solution 5      4     5     9    10    11     0
## Solution 6      4     5     9    10    11     0
## Solution 7      4     5     9    10    11     0
## Solution 8      3     4     9    10    11     0
## Solution 9      3     4     9    10    11     0
## Solution 10     3     4     9    10    11     0
##  
## (...)
##
## Solution 87      3     4     6     9    10    11
## Solution 88      3     4     6     9    10    11
## Solution 89      3     4     6     9    10    11
## Solution 90      2     3     4    10    11    12
## Solution 91      2     3     4    10    11    12
## Solution 92      2     3     4    10    11    12
## Solution 93      2     3     4    10    11    12
## Solution 94      2     3     4    10    11    12
## Solution 95      2     3     4    10    11    12
## Solution 96      2     3     4    10    11    12
## Solution 97      1     3     4     6    10    11
## Solution 98      1     3     4     6    10    11
## Solution 99      1     3     4     6    10    11
## Solution 100     1     3     4     6    10    11
## 
## 
## $values
##
##                 card.5    card.6
## Solution 1  0.5018922 0.5168627
## Solution 2  0.5018922 0.5168627
## Solution 3  0.5018922 0.5168627
## Solution 4  0.5018922 0.5168627
## Solution 5  0.5018922 0.5168627
## Solution 6  0.5018922 0.5168627
## Solution 7  0.5018922 0.5096500
## Solution 8  0.4966191 0.5096500
## Solution 9  0.4966191 0.5096500
## Solution 10 0.4966191 0.5096500
## 
## (...)
##
## Solution 87  0.4893824 0.5038649
## Solution 88  0.4893824 0.5038649
## Solution 89  0.4893824 0.5038649
## Solution 90  0.4893824 0.5035489
## Solution 91  0.4893824 0.5035489
## Solution 92  0.4893824 0.5035489
## Solution 93  0.4893824 0.5035489
## Solution 94  0.4893824 0.5035489
## Solution 95  0.4893824 0.5035489
## Solution 96  0.4893824 0.5035489
## Solution 97  0.4890986 0.5035386
## Solution 98  0.4890986 0.5035386
## Solution 99  0.4890986 0.5035386
## Solution 100 0.4890986 0.5035386
## 
## $bestvalues
##    Card.5    Card.6 
## 0.5018922 0.5168627 
## 
## $bestsets
##        Var.1 Var.2 Var.3 Var.4 Var.5 Var.6
## Card.5     4     5     9    10    11     0
## Card.6     4     5     9    10    11    12
## 
## $call
## genetic(mat = CarsHmat$mat, kmin = 5, kmax = 6, criterion = "zeta2", 
##     H = CarsHmat$H, r = 3, tolsym = 1e-09)
## 
## Warning message:
## 
##  The effect description matrix (H) supplied was slightly asymmetric: 
##  symmetric entries differed by up to 3.63797880709171e-12.
##  (less than the 'tolsym' parameter).
##  The H matrix has been replaced by its symmetric part.
##  in: validnovcrit(mat, criterion, H, r, p, tolval, tolsym) 
##

## The selected best variable subsets

colnames(CarsHmat$mat)[c(4,5,9,10,11)]

## [1] "Horsepower" "RPM"        "Length"     "Wheelbase"  "Width"     

colnames(CarsHmat$mat)[c(4,5,9,10,11,12)]

## [1] "Horsepower"  "RPM"         "Length"      "Wheelbase"   "Width"      
## [6] "Turn.circle"

## --------------------------------------------------------------------




