library(cmm)


### Name: Antisemitism
### Title: Change in antisemitism after seeing a movie
### Aliases: Antisemitism
### Keywords: datasets

### ** Examples

data(Antisemitism)

## Sample marginal distributions
# at applied to data gives vectorized 2x2x3 table TXR (Time x Seen film or not x Response)
at <- MarginalMatrix(c("X","A","B"), list(c("X","A"), c("X","B")), c(2,3,3));
stats = SampleStatistics(
  dat = Antisemitism, 
  coeff = at, 
  Labels = c("T","X","R"), 
  CoefficientDimensions = c(2,2,3))

## Models for table XR given T

# at1 applied to data gives vectorized conditional 2x3 table XR (XR conditional on T<-1)
at1 <- MarginalMatrix(c("X", "A", "B"), list(c("X", "A")), c(2, 3, 3));
# at2 applied to data gives vectorized conditional 2x3 table XR (XR conditional on T<-2)
at2 <- MarginalMatrix(c("X", "A", "B"), list(c("X", "B")), c(2, 3, 3));

bt1 <- ConstraintMatrix(c("X", "R"), list(c("X"), c("R")), c(2, 3));
bt2 <- ConstraintMatrix(c("X", "R"), list(c("X"), c("R")), c(2, 3));

model1 <- list(bt1, "log", at1);
model2 <- list(bt2, "log", at2);

# model1 doesn't converge, I don't know the reason and am trying to find out 
# (it does converge in the Mathematica programme).
fit = MarginalModelFit(
 dat = Antisemitism, 
 model = model2, 
 Labels = c("X","R"), 
 CoefficientDimensions = c(2,3), 
 MaxSteps=100, 
 ShowProgress=10,
 MaxStepSize=.5)



