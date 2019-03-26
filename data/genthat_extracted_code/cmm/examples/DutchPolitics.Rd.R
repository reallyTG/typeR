library(cmm)


### Name: DutchPolitics
### Title: Political party and candidate preference in the Netherlands
### Aliases: DutchPolitics
### Keywords: datasets

### ** Examples

data(DutchPolitics)

# Marginal homogeneity: A=C and B=D
at2a <- MarginalMatrix(c("A","B","C","D"), list(c("A"), c("C")), c(3, 3, 3, 3));
at2b <- MarginalMatrix(c("A","B","C","D"), list(c("B"), c("D")), c(3, 3, 3, 3));
bt2 <- ConstraintMatrix(c(1,2), list(c(1),c(2)), c(2,3));
at2 <- rbind(at2a, at2b);
bt2 <- DirectSum(bt2, bt2);

model <- list(bt2, "identity", at2);

mpolMH <- MarginalModelFit(DutchPolitics, model,
    MaxError = 10.^-25,
    MaxSteps = 200,
    MaxStepSize = .5,
    StartingPoint = "Automatic",
    CoefficientDimensions = c(2, 2, 3),
    ShowProgress = 50);




