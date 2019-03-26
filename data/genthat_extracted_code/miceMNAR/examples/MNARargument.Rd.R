library(miceMNAR)


### Name: MNARargument
### Title: Function providing modified arguments for imputation of Missing
###   Not At Random (MNAR) outcomes using 'mice()' function of the "mice"
###   package
### Aliases: MNARargument

### ** Examples


require(GJRM)
require(mvtnorm)
require(pbivnorm)
require(sampleSelection)

# Import dataset with a suspected MNAR mechanism
data("hiv") 

# We select only one region (lusuka) and 5 variables
lusuka <- hiv[hiv$region==5,c("hiv", "age", "marital", "condom", "smoke")]

# Categorical variables have to be recoded as factor
lusuka$hiv <- as.factor(lusuka$hiv)

#############################################
#### Missing data only on a binary outcome ##
#############################################

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

imputation <- mice(data = arg$data_mod,
                 method = arg$method,
                 predictorMatrix = arg$predictorMatrix,
                 JointModelEq=arg$JointModelEq,
                 control=arg$control,
                 maxit=1,m=5)

# Because of missing data only on one variable, fix maxit=1

# Estimation on each imputed dataset and pooling               
analysis <- with(imputation,glm(hiv~age+condom+marital,family=binomial(link="probit")))
result <- pool(analysis)
summary(result)

##########################################################
#### Missing data on a binary outcome and one covariate ##
##########################################################

# Generate missing values on the variable "condom" 
# According to a MAR mechanism using a probit model
prob <- pnorm((35.5-lusuka$age)/10.74) # Depending on "age"
lusuka$condom[rbinom(nrow(lusuka),size=1, prob=prob)==0] <- NA

JointModelEq <- generate_JointModelEq(data=lusuka,varMNAR = c("hiv"))
JointModelEq[,"hiv_var_sel"] <- c(0,1,1,1,1)
JointModelEq[,"hiv_var_out"] <- c(0,1,1,1,0)

arg <- MNARargument(data=lusuka,varMNAR=c("hiv"),JointModelEq=JointModelEq)

## Not run: 
##D # Imputation using mice function
##D imputation <- mice(data = arg$data_mod,
##D                  method = arg$method,
##D                  predictorMatrix = arg$predictorMatrix,
##D                  JointModelEq=arg$JointModelEq,
##D                  control=arg$control, 
##D                  maxit=5,m=5)
##D 
##D # As classically, estimation on each imputed datasets and pooling               
##D analysis <- with(imputation,glm(hiv~age+condom+marital,family=binomial(link="probit")))
##D result <- pool(analysis)
##D summary(result)
## End(Not run)

#################################################
#### Missing data only on a continuous outcome ##
#################################################

# Generation of a simulated dataset with MNAR mechanism on a continuous outcome

X1 <- rnorm(500,0,1)
X2 <- rbinom(500,1,0.5)
X3 <- rnorm(500,1,0.5)
  
errors <- rmvnorm(500,mean=c(0,0),sigma=matrix(c(1,0.3,0.3,1),nrow=2,byrow=TRUE))

Y <- X1+X2+errors[,1]
Ry <- ifelse(0.66+1*X1-0.5*X2+X3+errors[,2]>0,1,0)

Y[Ry==0] <- NA
  
simul_data <- data.frame(Y,X1,X2,X3)

JointModelEq <- generate_JointModelEq(data=simul_data,varMNAR = "Y")

JointModelEq[,"Y_var_sel"] <- c(0,1,1,1)
JointModelEq[,"Y_var_out"] <- c(0,1,1,0)

arg <- MNARargument(data=simul_data,varMNAR="Y",JointModelEq=JointModelEq)

imputation2 <- mice(data = arg$data_mod,
                 method = arg$method,
                 predictorMatrix = arg$predictorMatrix,
                 JointModelEq=arg$JointModelEq,
                 control=arg$control,
                 maxit=1,m=5)

analysis2 <- with(imputation,lm(Y~X1+X2+X3))
result2 <- pool(analysis2)
summary(result2)

#############################
## Using 2-step estimation ##
#############################

arg <- MNARargument(data=simul_data,varMNAR="Y",JointModelEq=JointModelEq)
arg$method["Y"] <- "hecknorm2step"

## Not run: 
##D imputation3 <- mice(data = arg$data_mod,
##D                  method = arg$method,
##D                  predictorMatrix = arg$predictorMatrix,
##D                  JointModelEq=arg$JointModelEq,
##D                  control=arg$control,
##D                  maxit=1,m=5)
##D 
##D analysis3 <- with(imputation3,lm(Y~X1+X2+X3))
##D result3 <- pool(analysis3)
##D summary(result3)
## End(Not run)



