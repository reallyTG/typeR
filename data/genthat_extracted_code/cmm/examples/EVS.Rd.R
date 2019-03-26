library(cmm)


### Name: EVS
### Title: European Values Study (EVS): attitude towards women's role in
###   society
### Aliases: EVS
### Keywords: datasets

### ** Examples

data(EVS)

# Table SAERW
var = c("S", "A", "E", "R", "W");
dim = c(2, 3, 3, 3, 2);

# matrices for table SA
at1 <- MarginalMatrix(var, c("S", "A"), dim);
bt1 <- ConstraintMatrix(c("S", "A"), list(c("S"), c("A")), c(2, 3));

# matrices for table SAER
at2 <- MarginalMatrix(var, c("S", "A", "E", "R"), dim);
bt2 <- ConstraintMatrix(var = c("S", "A", "E", "R"), 
                       suffconfigs = list(c("S", "A", "E"), c("S", "R"), c("A", "R")), 
                       dim = c(2, 3, 3, 3));

# matrices for table SAERW: constraints
at3 <- MarginalMatrix(var, c("S", "A", "E", "R", "W"), dim);
bt3 <- ConstraintMatrix(var = c("S", "A", "E", "R", "W"), 
 suffconfigs = list(c("S", "A", "E", "R"), c("S", "W"), c("A", "W"), c("E", "W"), c("R", "W")), 
 dim = c(2, 3, 3, 3, 2))

# matrix for table SAERW: design matrix
x <- DesignMatrix(var = c("S", "A", "E", "R", "W"), 
 suffconfigs = list(c("S", "A", "E", "R"), c("S", "W"), c("A", "W"), c("E", "W"), c("R", "W")), 
 dim = c(2, 3, 3, 3, 2));

# model1: specification using only constraints
at <- rbind(at1, at2, at3);
bt <- DirectSum(bt1, bt2);
bt <- DirectSum(bt, bt3);
model1 <- list(bt, "log", at);

# model2: same as model1 but using both constraints and a design matrix 
# to specify a loglinear model for the joint distribution
at <- rbind(at1, at2);
bt <- DirectSum(bt1, bt2);
model2 <- list(list(bt, "log", at), x);

nkps3 <- MarginalModelFit(EVS, model2, MaxError = 10.^-25,
    MaxSteps = 1000,
    ShowProgress = 10,
    MaxStepSize = .3 );



