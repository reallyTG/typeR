library(cmm)


### Name: DutchConcern
### Title: Concern about crime and social security in the Netherlands
### Aliases: DutchConcern
### Keywords: datasets

### ** Examples

data(DutchConcern)
n=c(t(ftable(DutchConcern)))

# Table 4.2
#NB: PLEASE REMOVE THE "#" BEFORE APPLY IN NEXT LINES, WON'T GO THROUGH R-CHECK OTHERWISE/
at1 = MarginalMatrix(c("S", "C", "T"), c("S", "T"), c(3, 3, 10));
print("Concern about social security:")
#apply(matrix(at1 %*% n, 10),1,function(x){100*x/sum(x)})
at2 = MarginalMatrix(c("S", "C", "T"), c("C", "T"), c(3, 3, 10));
print("Concern about crime:")
#apply(matrix(at2 %*% n, 10),1,function(x){100*x/sum(x)})


##############################################################################
# Define and fit models for marginal table IRT (Section 4.1.1)

# atIRT %*% n produces IRT table, dimension 2x3x10
atIRT = MarginalMatrix(c("S", "C", "T"), list(c("S", "T"), c("C", "T")), c(3, 3, 10));
# bt1.Log(atIRT.pi)=0 is marginal model for independence of IT and R \
bt1 = ConstraintMatrix(c("I", "R", "T"), list(c("I", "T"), c("R")), c(2, 3, 10));
bt2 = ConstraintMatrix(c("I", "R", "T"), list(c("I", "T"), c("R", "T")), c(2, 3, 10));
bt3 = ConstraintMatrix(c("I", "R", "T"), list(c("I", "T"), c("I", "R")), c(2, 3, 10));
bt4 = ConstraintMatrix(c("I", "R", "T"), list(c("I", "T"), 
      c("I", "R"), c("R", "T")), c(2, 3, 10));

model1 = list(bt1, "log", atIRT);
model2 = list(bt2, "log", atIRT);
model3 = list(bt3, "log", atIRT);
model4 = list(bt4, "log", atIRT);

#  change model1 to model2 etc to fit different models
pi1 = MarginalModelFit(n, model4,
   ShowProgress = 5,
   CoefficientDimensions = c(2, 3, 10),
   Labels = c("I", "R", "T"));

##############################################################################
# Simultaneous model for marginal and joint distributions (Section 4.1.2)

# define x, the design matrix for the loglinear model of Eq. 4.1
x <- DesignMatrix(var = c("S","C","T"), 
                  suffconfigs = c("S","C","T"), 
                  dim = c(3,3,10), 
                  SubsetCoding = list(c("S", "C", "T"),list("Nominal","Nominal","Linear")))
# model6 is the simultaneous model
model6 <- list(model4, x);

# NB: when fitting model6 Labels and CoefficientDimensions should be appropriate 
# to get the right output # for table IRT, which is different than for model5
#NB: REMOVE "#" IN NEXT LINE, WON'T GO THROUGH R-CHECK
#pi5 = MarginalModelFit(DutchConcern, model6, ShowProgress = 5, 
# CoefficientDimensions = c(2, 3, 10), Labels = c("I", "R", "T"), MaxSteps = 500, MaxStepSize=.2)



