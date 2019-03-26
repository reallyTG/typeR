library(intubate)


### Name: robustbase
### Title: Interfaces for robustbase package for data science pipelines.
### Aliases: ntbt_adjbox ntbt_glmrob ntbt_lmrob ntbt_ltsReg ntbt_nlrob
### Keywords: intubate magrittr robustbase adjbox glmrob lmrob ltsReg nlrob

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(robustbase)
##D 
##D 
##D ## ntbt_adjbox: Plot an Adjusted Boxplot for Skew Distributions
##D ## Original function to interface
##D adjbox(len ~ dose, data = ToothGrowth)
##D 
##D ## The interface puts data as first parameter
##D ntbt_adjbox(ToothGrowth, len ~ dose)
##D 
##D ## so it can be used easily in a pipeline.
##D ToothGrowth %>%
##D   ntbt_adjbox(len ~ dose)
##D 
##D 
##D ## ntbt_glmrob: Robust Fitting of Generalized Linear Models
##D data(carrots)
##D 
##D ## Original function to interface
##D glmrob(cbind(success, total-success) ~ logdose + block,
##D        family = binomial, data = carrots, method= "Mqle",
##D        control= glmrobMqle.control(tcc=1.2))
##D 
##D ## The interface puts data as first parameter
##D ntbt_glmrob(carrots, cbind(success, total-success) ~ logdose + block,
##D             family = binomial, method= "Mqle",
##D             control= glmrobMqle.control(tcc=1.2))
##D 
##D ## so it can be used easily in a pipeline.
##D carrots %>%
##D   ntbt_glmrob(cbind(success, total-success) ~ logdose + block,
##D               family = binomial, method= "Mqle",
##D               control= glmrobMqle.control(tcc=1.2))
##D 
##D 
##D ## ntbt_lmrob: MM-type Estimators for Linear Regression
##D data(coleman)
##D 
##D ## Original function to interface
##D set.seed(0)
##D lmrob(Y ~ ., data = coleman, setting = "KS2011")
##D 
##D ## The interface puts data as first parameter
##D ntbt_lmrob(coleman, Y ~ ., setting = "KS2011")
##D 
##D ## so it can be used easily in a pipeline.
##D coleman %>%
##D   ntbt_lmrob(Y ~ ., setting = "KS2011")
##D 
##D 
##D ## ntbt_ltsReg: Least Trimmed Squares Robust (High Breakdown) Regression
##D data(stackloss)
##D 
##D ## Original function to interface
##D ltsReg(stack.loss ~ ., data = stackloss)
##D 
##D ## The interface puts data as first parameter
##D ntbt_ltsReg(stackloss, stack.loss ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D stackloss %>%
##D   ntbt_ltsReg(stack.loss ~ .)
##D 
##D 
##D ## ntbt_nlrob: Robust Fitting of Nonlinear Regression Models
##D DNase1 <- DNase[ DNase$Run == 1, ]
##D 
##D ## Original function to interface
##D nlrob(density ~ Asym/(1 + exp(( xmid - log(conc) )/scal ) ),
##D       data = DNase1, trace = TRUE,
##D       start = list( Asym = 3, xmid = 0, scal = 1 ))
##D 
##D ## The interface puts data as first parameter
##D ntbt_nlrob(DNase1, density ~ Asym/(1 + exp(( xmid - log(conc) )/scal ) ),
##D            trace = TRUE,
##D            start = list( Asym = 3, xmid = 0, scal = 1 ))
##D 
##D ## so it can be used easily in a pipeline.
##D DNase1 %>%
##D   ntbt_nlrob(density ~ Asym/(1 + exp(( xmid - log(conc) )/scal ) ),
##D              trace = TRUE,
##D              start = list( Asym = 3, xmid = 0, scal = 1 ))
## End(Not run)



