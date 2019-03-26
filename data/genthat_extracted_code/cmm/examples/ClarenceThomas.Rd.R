library(cmm)


### Name: ClarenceThomas
### Title: Opinion on Supreme Court nominee Clarence Thomas, two-wave panel
###   study
### Aliases: ClarenceThomas
### Keywords: datasets

### ** Examples

data(ClarenceThomas)

################################################################
## Marginal homogeneity: O1=O2

# at24 produces vectorized 2x4 table TR (Time x Response)
at24 <- MarginalMatrix(c("A", "B"), list(c("A"), c("B")), c(4, 4));

# marginal homogeneity
bt1 <- ConstraintMatrix(c("T", "R"), list(c("T"), c("R")), c(2, 4));
model1 <- list(bt1, "log", at24);

# only first two categories are equated
bt2 <- rbind(
   c(1, 0, 0, 0,  -1, 0, 0, 0),
   c(0, 1, 0, 0,   0,-1, 0, 0));
model2 <- c(bt2, "log", at24);

pi11 <- MarginalModelFit(ClarenceThomas, model1,
    MaxSteps = 500,
    ShowProgress = 20,
    MaxStepSize = .5,
    CoefficientDimensions = c(2, 4),
    Labels = c("T", "R"),
    Title = "Clarence Thomas data, MH");


################################################################
## Marginal homogeneity: P1=P2
# P1 and P2 are O1 and O2 conditioned on not being in category 4

# at24 produces vectorized 2x4 table TR (Time x Response
at24 <- MarginalMatrix(c("A", "B"), list(c("A"), c("B")), c(4, 4));

# specify conditional probabilities using generalized exp-log notation
at1 <- rbind(c(1, 0, 0, 0), c(0, 1, 0, 0), c(0, 0, 1, 0), c(1, 1, 1, 0));
at1 <- DirectSum(at1, at1);
at2 <- rbind(c(1, 0, 0, -1), c(0, 1, 0, -1), c(0, 0, 1, -1));
at2 <- DirectSum(at2, at2);
coeff <- list(list(diag(6), at2, at1), list("exp", "log", "identity"));

# marginal homogeneity
bt1 <- ConstraintMatrix(c("T", "R"), list(c("T"), c("R")), c(2, 3));

model1 <- list(bt1, coeff, at24);

pi11 <- MarginalModelFit(ClarenceThomas, model1,
    MaxSteps = 500,
    ShowProgress = 20,
    MaxStepSize = .5,
    CoefficientDimensions = c(2, 3),
    Labels = c("T", "R"),
    Title = "Clarence Thomas data, MH");




