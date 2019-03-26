library(cmm)


### Name: MarihuanaAlcohol
### Title: Marihuana and alcohol use during adolescence, five-wave panel
### Aliases: MarihuanaAlcohol
### Keywords: datasets

### ** Examples

data(MarihuanaAlcohol)

# Table MA: marginal loglinear analysis  (BCH Section 4.2.1)
# listwise deletion of missing values and deletion of Gender and Alcohol use
dat <- MarihuanaAlcohol[-row(MarihuanaAlcohol)[is.na(MarihuanaAlcohol)],2:6]

# at yields the vectorized 5x3 table MA (marijuana use x age)
at <- MarginalMatrix(var =  c("M1", "M2", "M3", "M4", "M5"), 
 marg = list(c("M1"), c("M2"), c("M3"), c("M4"), c("M5")), 
 dim = c(3, 3, 3, 3, 3))
obscoeff <- SampleStatistics(dat = dat, 
 coeff = list("log", at), 
 CoefficientDimensions = c(5,3), 
 Labels = c("Age", "M"), 
 ShowCoefficients = FALSE, 
 ShowParameters = TRUE)



