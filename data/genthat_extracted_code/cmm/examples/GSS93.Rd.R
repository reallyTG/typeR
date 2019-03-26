library(cmm)


### Name: GSS93
### Title: Political Orientation and Religion in the United States in 1993
###   (General Social Survey, 1993)
### Aliases: GSS93
### Keywords: datasets

### ** Examples

data(GSS93)

## Table 2.1 of Bergsma, Croon, & Hagenaars (2009)
addmargins(table(GSS93[,1:2]))

## Table 2.2 of Bergsma, Croon, & Hagenaars (2009)
# Specify coefficients
coeff <- list("log",diag(21))
SampleStatistics(dat = GSS93[, 1 : 2],
 coeff = coeff,
 CoefficientDimensions = c(7, 3),
 Labels = c("P","R"), 
 ShowParameters = TRUE, 
 ShowCoefficients = FALSE)

## Table 2.3 of Bergsma, Croon, & Hagenaars (2009)
ftable(B + R ~ P , data = GSS93)


########################################################
## Models for table PR

#independence of P and R
bt1 <- ConstraintMatrix(c("P", "R"), list(c("P"), c("R")), c(7,3));
#linear by nominal model
bt2 <- ConstraintMatrix(var = c("P", "R"), 
  suffconfigs = list(c("P", "R")), 
  dim = c(7, 3), 
  SubsetCoding = list(c("P", "R"), c("Linear", "Nominal")))
#linear by nominal model with equality of first two nominal parameters
bt3 <- ConstraintMatrix(var = c("P", "R"), 
 suffconfigs = list(c("P", "R")), 
 dim = c(7, 3), 
 SubsetCoding = list(c("P", "R"), list("Linear", rbind(c(1, 1, 0), c(0, 0, 1)))))
m <- MarginalModelFit(dat = GSS93[,1:2],
 model = list(bt2,"log"), 
 ShowCoefficients = FALSE, 
 ShowProgress = 1, 
 ShowParameters = TRUE, 
 CoefficientDimensions = c(7, 3),
 Labels = c("P", "R"),
 ParameterCoding = list("Polynomial", "Effect"))


########################################################
## Models for table PRB

#various loglinear models
bt1 <- ConstraintMatrix(c("P", "R","B"), list(c("P","R"),c("B")), c(7,3,4))
bt2 <- ConstraintMatrix(c("P", "R","B"), list(c("P","R"),c("R","B")), c(7,3,4))
bt3 <- ConstraintMatrix(c("P", "R","B"), list(c("P","R"),c("P","B")), c(7,3,4))
bt4 <- ConstraintMatrix(c("P", "R","B"), list(c("P","R"),c("P","B"),c("R","B")), c(7,3,4))
bt5 <- ConstraintMatrix(c("P", "R","B"), list(c("P","R"),c("P","B"),c("R","B")), c(7,3,4), 
 SubsetCoding = list(list(c("P", "B"), c("Linear", "Linear")), 
                list(c("R", "B"), c("Nominal", "Linear"))))

m <- MarginalModelFit(dat = GSS93,
 model = list(bt2,"log"), 
 ShowCoefficients = FALSE, 
 ShowProgress = 1, 
 ShowParameters = TRUE,
 CoefficientDimensions =c(7, 3, 4),
 Labels = c("P", "R", "B"), 
 ParameterCoding = list("Polynomial", "Polynomial", "Effect"))



