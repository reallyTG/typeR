library(cmm)


### Name: NES
### Title: Political Orientation in the US, three-wave panel study
### Aliases: NES
### Keywords: datasets

### ** Examples

data(NES)

####################################################################################
# Models for marginal homogeneity over time (Section 4.2.1)

# Marginal homogeneity : no change in political orientation over time

at <- MarginalMatrix(c("T1", "T2", "T3"), list(c("T1"), c("T2"), c("T3")), c(7,7,7));
bt1 <- ConstraintMatrix(c("T", "P"), list(c("T"), c("P")), c(3, 7));

model1 <- list(bt1, "identity", at);

start <- c(t(ftable(NES))) + .001;
pihat <- MarginalModelFit(NES, model1,
    MaxSteps = 1000, StartingPoint = start,
    ShowProgress = 100, MaxError = 1e-28,
    CoefficientDimensions = c(3,7), ShowCoefficients = TRUE,
    ShowParameters = FALSE, Labels = c("T", "P"));



