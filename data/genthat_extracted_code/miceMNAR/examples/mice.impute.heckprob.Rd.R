library(miceMNAR)


### Name: mice.impute.heckprob
### Title: Imputation by bivariate probit sample selection model for binary
###   Missing Not At Random outcome
### Aliases: mice.impute.heckprob

### ** Examples


# Import dataset with a suspected MNAR mechanism
require("GJRM")
require(mvtnorm)
require(pbivnorm)
data("hiv") 

# We select only one region (lusuka) and 5 variables
lusuka <- hiv[hiv$region==5,c("hiv", "age", "marital", "condom", "smoke")]

# Categorical variables have to be recoded as factor
lusuka$hiv <- as.factor(lusuka$hiv)

# Specify a selection (missing data mechanism) and an outcome equation (analyse model)

# Generate an empty matrix

JointModelEq <- generate_JointModelEq(data=lusuka,varMNAR = "hiv")

# Fill in with 1 for variable included in equations
JointModelEq[,"hiv_var_sel"] <- c(0,1,1,1,1)
JointModelEq[,"hiv_var_out"] <- c(0,1,1,1,0)

# Generation of argument for MNAR imputation model in "mice()" function
arg <- MNARargument(data=lusuka,varMNAR="hiv",JointModelEq=JointModelEq)

# Imputation using mice() function
# Values returned have to be included in the "mice()" function as argument:

## Not run: 
##D imputation <- mice(data = arg$data_mod,
##D                  method = arg$method,
##D                  predictorMatrix = arg$predictorMatrix,
##D                  JointModelEq=arg$JointModelEq,
##D                  control=arg$control,
##D                  maxit=1,m=5)
##D 
##D # Because of missing data only on one variable, fix maxit=1
##D 
##D # Estimation on each imputed dataset and pooling               
##D analysis <- with(imputation,glm(hiv~age+condom+marital,family=binomial(link="probit")))
##D result <- pool(analysis)
##D summary(result)
## End(Not run)



