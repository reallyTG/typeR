library(miceMNAR)


### Name: generate_JointModelEq
### Title: Generation of an empty matrix for sample selection model
### Aliases: generate_JointModelEq

### ** Examples

# Import dataset with a suspected MNAR mechanism
require(GJRM)
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
# This indicates that age, marital, condom and smoke are included in the selection equation of hiv
JointModelEq[,"hiv_var_out"] <- c(0,1,1,1,0) 
# This indicates that age, marital and condom are included in the outcome equation of hiv




