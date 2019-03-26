library(HHG)


### Name: HHG-package
### Title: Heller-Heller-Gorfine (HHG) Tests of Independence and Equality
###   of Distributions
### Aliases: HHG-package HHG

### ** Examples


## Not run: 
##D 
##D # Some examples, for more see the vignette('HHG') and specific help pages
##D 
##D #######################################
##D #1. Univariate Independence Example
##D #######################################
##D #For (N<100):
##D 
##D N = 30
##D data = hhg.example.datagen(N, 'Parabola')
##D X = data[1,]
##D Y = data[2,]
##D plot(X,Y)
##D 
##D #For (N<100) , Option 1: Perform the ADP combined test
##D #using partitions sizes up to 4. see documentation for other parameters of the combined test 
##D #(it is recommended to use mmax >= 4, or the default parameter for large data sets)
##D combined = hhg.univariate.ind.combined.test(X,Y,nr.perm = 200,mmax=4)
##D combined
##D 
##D 
##D #For (N<100) , Option 2: Perform the hhg test:
##D 
##D ## Compute distance matrices, on which the HHG test will be based
##D Dx = as.matrix(dist((X), diag = TRUE, upper = TRUE))
##D Dy = as.matrix(dist((Y), diag = TRUE, upper = TRUE))
##D 
##D hhg = hhg.test(Dx, Dy, nr.perm = 1000)
##D 
##D hhg
##D 
##D #For N>100, Fast.independence.test is the reccomended option:
##D 
##D N_Large = 1000
##D data_Large = hhg.example.datagen(N_Large, 'W')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D 
##D NullTable_for_N_Large_MXL_tables = Fast.independence.test.nulltable(N_Large, variant = 'ADP-EQP-ML',
##D nr.atoms = 30,nr.perm=200)
##D 
##D 
##D ADP_EQP_ML_Result = Fast.independence.test(X_Large,Y_Large, NullTable_for_N_Large_MXL_tables)
##D 
##D ADP_EQP_ML_Result
##D 
##D #######################################
##D #2. Univariate K-Sample Example
##D #######################################
##D 
##D N0=50
##D N1=50
##D X = c(c(rnorm(N0/2,-2,0.7),rnorm(N0/2,2,0.7)),c(rnorm(N1/2,-1.5,0.5),rnorm(N1/2,1.5,0.5)))
##D Y = (c(rep(0,N0),rep(1,N1)))
##D #plot the two distributions by group index (0 or 1)
##D plot(Y,X)
##D 
##D 
##D #Option 1: Perform the distribution-free test for equality of a univariate distribution
##D combined.test = hhg.univariate.ks.combined.test(X,Y)
##D combined.test
##D 
##D 
##D 
##D #Option 2: Perform the permutation test for equality of distributions.
##D 
##D 
##D Dx = as.matrix(dist(X, diag = TRUE, upper = TRUE))
##D 
##D hhg = hhg.test.k.sample(Dx, Y, nr.perm = 1000)
##D 
##D hhg
##D 
##D 
##D #######################################
##D #3. Multivariate Independence Example:
##D #######################################
##D 
##D n=30 #number of samples
##D dimensions_x=5 #dimension of X matrix
##D dimensions_y=5 #dimension of Y matrix
##D X=matrix(rnorm(n*dimensions_x,mean = 0, sd = 1),nrow = n,ncol = dimensions_x) #generate noise
##D Y=matrix(rnorm(n*dimensions_y,mean =0, sd = 3),nrow = n,ncol = dimensions_y)
##D 
##D Y[,1] = Y[,1] + X[,1] + 4*(X[,1])^2 #add in the relations
##D Y[,2] = Y[,2] + X[,2] + 4*(X[,2])^2
##D 
##D #compute the distance matrix between observations.
##D #User may use other distance metrics.
##D Dx = as.matrix(dist((X)), diag = TRUE, upper = TRUE) 
##D Dy = as.matrix(dist((Y)), diag = TRUE, upper = TRUE)
##D 
##D #run test
##D hhg = hhg.test(Dx, Dy, nr.perm = 1000)
##D 
##D hhg
##D 
##D 
##D #######################################
##D #4. Multivariate K-Sample Example
##D #######################################
##D 
##D #multivariate k-sample, with k=3 groups
##D n=100 #number of samples in each group
##D x1 = matrix(rnorm(2*n),ncol = 2) #group 1
##D x2 = matrix(rnorm(2*n),ncol = 2) #group 2
##D x2[,2] = 1*x2[,1] + x2[,2]
##D x3 = matrix(rnorm(2*n),ncol = 2) #group 3
##D x3[,2] = -1*x3[,1] + x3[,2]
##D x= rbind(x1,x2,x3)
##D y=c(rep(0,n),rep(1,n),rep(2,n)) #group numbers, starting from 0 to k-1
##D 
##D plot(x[,1],x[,2],col = y+1,xlab = 'first component of X',ylab = 'second component of X',
##D      main = 'Multivariate K-Sample Example with K=3 \n Groups Marked by Different Colors')
##D 
##D Dx = as.matrix(dist(x, diag = TRUE, upper = TRUE)) #distance matrix
##D 
##D hhg = hhg.test.k.sample(Dx, y, nr.perm = 1000) 
##D 
##D hhg
##D 
## End(Not run)




