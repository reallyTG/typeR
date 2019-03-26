library(PGEE)


### Name: yeastG1
### Title: Yeast cell-cycle gene expression data
### Aliases: yeastG1

### ** Examples

## Not run: 
##D library(PGEE)
##D # load data
##D data(yeastG1)
##D data <- yeastG1
##D # get the column names
##D colnames(data)[1:9]
##D # see some portion of yeast G1 data
##D head(data,5)[1:9]
##D 
##D # define the input arguments
##D formula <- "y ~.-id"
##D family <- gaussian(link = "identity")
##D lambda.vec <- seq(0.01,0.2,0.01)
##D # find the optimum lambda
##D cv <- CVfit(formula = formula, id = id, data = data, family = family, scale.fix = TRUE,
##D scale.value = 1, fold = 4, lambda.vec = lambda.vec, pindex = c(1,2), eps = 10^-6,
##D maxiter = 30, tol = 10^-6)
##D # print the results
##D print(cv)
##D 
##D # see the returned values by CVfit
##D names(cv)
##D # get the optimum lambda
##D cv$lam.opt
##D 
##D #fit the PGEE model
##D myfit1 <- PGEE(formula = formula, id = id, data = data, na.action = NULL,
##D family = family, corstr = "independence", Mv = NULL,
##D beta_int = c(rep(0,dim(data)[2]-1)), R = NULL, scale.fix = TRUE,
##D scale.value = 1, lambda = cv$lam.opt, pindex = c(1,2), eps = 10^-6, 
##D maxiter = 30, tol = 10^-6, silent = TRUE)
##D 
##D # get the values returned by myfit object
##D names(myfit1)
##D # get the values returned by summary(myfit) object
##D names(summary(myfit1))
##D # see a portion of the results returned by coef(summary(myfit1))
##D head(coef(summary(myfit1)),7)
##D 
##D # see the variables which have non-zero coefficients
##D index1 <- which(abs(coef(summary(myfit1))[,"Estimate"]) > 10^-3)
##D names(abs(coef(summary(myfit1))[index1,"Estimate"]))
##D 
##D # see the PGEE summary statistics of these non-zero variables
##D coef(summary(myfit1))[index1,]
##D 
##D # fit the GEE model
##D myfit2 <- MGEE(formula = formula, id = id, data = data, na.action = NULL,
##D family = family, corstr = "independence", Mv = NULL,
##D beta_int = c(rep(0,dim(data)[2]-1)), R = NULL, scale.fix = TRUE,
##D scale.value = 1, maxiter = 30, tol = 10^-6, silent = TRUE)
##D 
##D # get the GEE summary statistics of the variables that turned out to be
##D # non-zero in PGEE analysis
##D coef(summary(myfit2))[index1,]
##D 
##D # see the significantly associated TFs in PGEE analysis
##D names(which(abs(coef(summary(myfit1))[index1,"Robust z"]) > 1.96))
##D 
##D # see the significantly associated TFs in GEE analysis
##D names(which(abs(coef(summary(myfit2))[,"Robust z"]) > 1.96))
##D 
## End(Not run)



