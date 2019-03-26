library(gnm)


### Name: nonlin.function
### Title: Functions to Specify Nonlinear Terms in gnm Models
### Aliases: nonlin.function
### Keywords: models regression nonlinear

### ** Examples

### Equivalent of weighted.MM function in ?nls
weighted.MM <- function(resp, conc){
    list(predictors = list(Vm = substitute(conc), K = 1),
         variables = list(substitute(resp), substitute(conc)),
         term = function(predictors, variables) {
             pred <- paste("(", predictors[1], "/(", predictors[2],
                           " + ", variables[2], "))", sep = "")
             pred <- paste("(", variables[1], " - ", pred, ")/sqrt(",
                           pred, ")", sep = "")
         })
}
class(weighted.MM) <- "nonlin"

## use to fitted weighted Michaelis-Menten model
Treated <- Puromycin[Puromycin$state == "treated", ]
Pur.wt.2 <- gnm( ~ -1 + weighted.MM(rate, conc), data = Treated,
                start = c(Vm = 200, K = 0.1), verbose = FALSE)
Pur.wt.2
## 
## Call:
## gnm(formula = ~-1 + weighted.MM(rate, conc), data = Treated, 
##     start = c(Vm = 200, K = 0.1), verbose = FALSE)
## 
## Coefficients:
##        Vm          K  
## 206.83477    0.05461  
## 
## Deviance:            14.59690 
## Pearson chi-squared: 14.59690 
## Residual df:         10

### The definition of MultHomog
MultHomog <- function(..., inst = NULL){
    dots <- match.call(expand.dots = FALSE)[["..."]]
    list(predictors = dots,
         common = rep(1, length(dots)),
         term = function(predictors, ...) {
             paste("(", paste(predictors, collapse = ")*("), ")", sep = "")
         },
         call = as.expression(match.call()))
}
class(MultHomog) <- "nonlin"
## use to fit homogeneous multiplicative interaction
set.seed(1)
RChomog <- gnm(Freq ~ origin + destination + Diag(origin, destination) +
               MultHomog(origin, destination), ofInterest = "MultHomog",
               family = poisson, data = occupationalStatus,
               verbose = FALSE)
RChomog
## 
## Call:
## 
## gnm(formula = Freq ~ origin + destination + Diag(origin, destination) + 
##     MultHomog(origin, destination), ofInterest = "MultHomog", family = poisson, 
##     data = occupationalStatus, verbose = FALSE)
## 
## Coefficients of interest:
## MultHomog(origin, destination)1  
##                              -1.50089  
## MultHomog(origin, destination)2  
##                              -1.28260  
## MultHomog(origin, destination)3  
##                              -0.68443  
## MultHomog(origin, destination)4  
##                              -0.10055  
## MultHomog(origin, destination)5  
##                              -0.08338  
## MultHomog(origin, destination)6  
##                               0.42838  
## MultHomog(origin, destination)7  
##                               0.84452  
## MultHomog(., .).`origin|destination`8  
##                               1.08809  
## 
## Deviance:            32.56098 
## Pearson chi-squared: 31.20716 
## Residual df:         34 
##

## the definition of Exp
Exp <- function(expression, inst = NULL){
    list(predictors = list(substitute(expression)),
         term = function(predictors, ...) {
             paste("exp(", predictors, ")", sep = "")
         },
         call = as.expression(match.call()),
         match = 1)
}
class(Exp) <- "nonlin"


## use to fit exponentional model
x <- 1:100
y <- exp(- x / 10)
set.seed(4)
exp1 <- gnm(y ~ Exp(1 + x), verbose = FALSE)
exp1
## 
## Call:
## gnm(formula = y ~ Exp(1 + x), verbose = FALSE)
## 
## Coefficients:
##            (Intercept)  Exp(. + x).(Intercept)
##              1.549e-11              -7.934e-11
##           Exp(1 + .).x  
##             -1.000e-01 
## 
## Deviance:            9.342418e-20 
## Pearson chi-squared: 9.342418e-20 
## Residual df:         97



