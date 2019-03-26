library(sirt)


### Name: lsdm
### Title: Least Squares Distance Method of Cognitive Validation
### Aliases: lsdm summary.lsdm
### Keywords: Least Squares Distance Method (LSDM) summary

### ** Examples

#############################################################################
# EXAMPLE 1: DATA FISCHER (see Dimitrov, 2007)
#############################################################################

# item difficulties
b <- c( 0.171,-1.626,-0.729,0.137,0.037,-0.787,-1.322,-0.216,1.802,
    0.476,1.19,-0.768,0.275,-0.846,0.213,0.306,0.796,0.089,
    0.398,-0.887,0.888,0.953,-1.496,0.905,-0.332,-0.435,0.346,
    -0.182,0.906)
# read Q-matrix
Qmatrix <- c( 1,1,0,1,0,0,0,0,1,0,1,0,0,0,0,0,1,0,0,1,0,0,0,0,
    1,0,1,1,0,0,0,0,1,0,0,1,0,0,0,0,0,1,0,0,1,1,0,0,1,0,1,0,1,0,0,0,
    1,0,1,0,1,1,0,0,1,0,1,1,0,1,0,0,1,0,0,1,0,1,0,0,1,0,1,1,1,0,0,0,
    1,0,0,1,0,0,1,0,1,0,0,1,0,0,1,0,1,0,1,0,0,0,1,0,1,1,0,1,0,1,1,0,
    1,0,1,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,0,1,0,0,0,1,
    0,1,0,0,0,1,0,1,1,1,0,1,0,1,0,1,1,0,0,1,0,1,0,0,1,1,0,0,1,0,0,0,
    1,0,0,1,1,0,0,0,1,1,0,1,0,0,0,0,1,0,1,1,0,0,0,0,1,0,1,1,0,1,0,0,
    1,1,0,1,0,0,0,0,1,0,1,1,1,1,0,0 )
Qmatrix <- matrix( Qmatrix, nrow=29, byrow=TRUE )
colnames(Qmatrix) <- paste("A",1:8,sep="")
rownames(Qmatrix) <- paste("Item",1:29,sep="")

# Perform a LSDM analysis
lsdm.res <- sirt::lsdm( b=b, Qmatrix=Qmatrix )
summary(lsdm.res)
  ## Model Fit
  ## Model Fit LSDM   -  Mean MAD:  0.071     Median MAD:   0.07
  ## Model Fit LLTM   -  Mean MAD:  0.079     Median MAD:  0.063    R^2=0.615
  ## ................................................................................
  ## Attribute Parameters
  ##    N.Items  b.2PL a.2PL  b.1PL eta.LLTM se.LLTM pval.LLTM
  ## A1      27 -2.101 1.615 -2.664   -1.168   0.404     0.009
  ## A2       8 -3.736 3.335 -5.491   -0.645   0.284     0.034
  ## A3      12 -5.491 0.360 -2.685   -0.013   0.284     0.963
  ## A4      22 -0.081 0.744 -0.059    1.495   0.350     0.000
  ## A5       7 -2.306 0.580 -1.622    0.243   0.301     0.428
  ## A6      10 -1.946 0.542 -1.306    0.447   0.243     0.080
  ## A7       5 -4.247 1.283 -4.799   -0.147   0.316     0.646
  ## A8       5 -2.670 0.663 -2.065    0.077   0.310     0.806
  ## [...]

#############################################################################
# EXAMPLE 2 DATA HENNING (see Dimitrov, 2007)
#############################################################################

# item difficulties
b <- c(-2.03,-1.29,-1.03,-1.58,0.59,-1.65,2.22,-1.46,2.58,-0.66)
# item slopes
a <- c(0.6,0.81,0.75,0.81,0.62,0.75,0.54,0.65,0.75,0.54)
# define Q-matrix
Qmatrix <- c(1,0,0,0,0,0,1,0,0,0,0,1,0,1,0,0,1,0,0,0,0,1,1,0,0,
    0,0,0,1,0,0,1,0,0,1,0,0,0,1,0,0,0,0,1,1,1,0,1,0,0 )
Qmatrix <- matrix( Qmatrix, nrow=10, byrow=TRUE )
colnames(Qmatrix) <- paste("A",1:5,sep="")
rownames(Qmatrix) <- paste("Item",1:10,sep="")

# LSDM analysis
lsdm.res <- sirt::lsdm( b=b, a=a, Qmatrix=Qmatrix )
summary(lsdm.res)
  ## Model Fit LSDM   -  Mean MAD:  0.061     Median MAD:   0.06
  ## Model Fit LLTM   -  Mean MAD:  0.069     Median MAD:  0.069    R^2=0.902
  ## ................................................................................
  ## Attribute Parameters
  ##    N.Items  b.2PL a.2PL  b.1PL eta.LLTM se.LLTM pval.LLTM
  ## A1       2 -2.727 0.786 -2.367   -1.592   0.478     0.021
  ## A2       5 -2.099 0.794 -1.834   -0.934   0.295     0.025
  ## A3       2 -0.763 0.401 -0.397    1.260   0.507     0.056
  ## A4       4 -1.459 0.638 -1.108   -0.738   0.309     0.062
  ## A5       2  2.410 0.509  1.564    2.673   0.451     0.002
  ## [...]
  ##
  ##  Discrimination Parameters
  ##
  ##            A1    A2   A3    A4    A5
  ##  Item1  1.723    NA   NA    NA    NA
  ##  Item2     NA 1.615   NA    NA    NA
  ##  Item3     NA 0.650   NA 0.798    NA
  ##  Item4     NA 1.367   NA    NA    NA
  ##  Item5     NA 1.001 1.26    NA    NA
  ##  Item6     NA    NA   NA 0.866    NA
  ##  Item7     NA 0.697   NA    NA 0.891
  ##  Item8     NA    NA   NA 0.997    NA
  ##  Item9     NA    NA   NA 1.312 1.074
  ##  Item10 1.000    NA 0.74    NA    NA

## Not run: 
##D #############################################################################
##D # EXAMPLE 3: PISA reading (data.pisaRead)
##D #    using nonparametrically estimated item response functions
##D #############################################################################
##D 
##D data(data.pisaRead)
##D # response data
##D dat <- data.pisaRead$data
##D dat <- dat[, substring( colnames(dat),1,1)=="R" ]
##D # define Q-matrix
##D pars <- data.pisaRead$item
##D Qmatrix <- data.frame(  "A0"=1*(pars$ItemFormat=="MC" ),
##D                   "A1"=1*(pars$ItemFormat=="CR" ) )
##D 
##D # start with estimating the 1PL in order to get person parameters
##D mod <- sirt::rasch.mml2( dat )
##D theta <- sirt::wle.rasch( dat=dat,b=mod$item$b )$theta
##D # Nonparametric estimation of item response functions
##D mod2 <- sirt::np.dich( dat=dat, theta=theta, thetagrid=seq(-3,3,len=100) )
##D 
##D # LSDM analysis
##D lsdm.res <- sirt::lsdm( data=mod2$estimate, Qmatrix=Qmatrix, theta=mod2$thetagrid)
##D summary(lsdm.res)
##D   ## Model Fit
##D   ## Model Fit LSDM   -  Mean MAD:  0.215     Median MAD:  0.151
##D   ## Model Fit LLTM   -  Mean MAD:  0.193     Median MAD:  0.119    R^2=0.285
##D   ## ................................................................................
##D   ## Attribute Parameter
##D   ##    N.Items  b.2PL a.2PL  b.1PL eta.LLTM se.LLTM pval.LLTM
##D   ## A0       5  1.326 0.705  1.289   -0.455   0.965     0.648
##D   ## A1       7 -1.271 1.073 -1.281   -1.585   0.816     0.081
##D 
##D #############################################################################
##D # EXAMPLE 4: Fraction subtraction dataset
##D #############################################################################
##D 
##D data( data.fraction1, package="CDM")
##D data <- data.fraction1$data
##D q.matrix <- data.fraction1$q.matrix
##D 
##D #****
##D # Model 1: 2PL estimation
##D mod1 <- sirt::rasch.mml2( data, est.a=1:nrow(q.matrix) )
##D 
##D # LSDM analysis
##D lsdm.res1 <- sirt::lsdm( b=mod1$item$b, a=mod1$item$a, Qmatrix=q.matrix )
##D summary(lsdm.res1)
##D   ##
##D   ##   Model Fit LSDM   -  Mean MAD:  0.076     Median MAD:  0.055
##D   ##   Model Fit LLTM   -  Mean MAD:  0.153     Median MAD:  0.155    R^2=0.801
##D   ##   ................................................................................
##D   ##   Attribute Parameter
##D   ##       N.Items   b.2PL a.2PL  b.1PL eta.LLTM se.LLTM pval.LLTM
##D   ##   QT1      14  -0.741 2.991 -1.115   -0.815   0.217     0.004
##D   ##   QT2       8 -80.387 0.031 -4.806   -0.025   0.262     0.925
##D   ##   QT3      12  -2.461 0.711 -2.006   -0.362   0.268     0.207
##D   ##   QT4       9  -0.019 3.873 -0.100    1.465   0.345     0.002
##D   ##   QT5       3  -3.062 0.375 -1.481    0.254   0.280     0.387
##D 
##D #****
##D # Model 2: 1PL estimation
##D mod2 <- sirt::rasch.mml2( data  )
##D 
##D # LSDM analysis
##D lsdm.res2 <- sirt::lsdm( b=mod1$item$b, Qmatrix=q.matrix )
##D summary(lsdm.res2)
##D   ##
##D   ##   Model Fit LSDM   -  Mean MAD:  0.046     Median MAD:   0.03
##D   ##   Model Fit LLTM   -  Mean MAD:  0.041     Median MAD:  0.042    R^2=0.772
##D 
##D #############################################################################
##D # EXAMPLE 5: Dataset LLTM Sonnleitner Reading Comprehension (Sonnleitner, 2008)
##D #############################################################################
##D 
##D # item difficulties Table 7, p. 355 (Sonnleitner, 2008)
##D b <- c(-1.0189,1.6754,-1.0842,-.4457,-1.9419,-1.1513,2.0871,2.4874,-1.659,-1.197,-1.2437,
##D     2.1537,.3301,-.5181,-1.3024,-.8248,-.0278,1.3279,2.1454,-1.55,1.4277,.3301)
##D b <- b[-21] # remove Item 21
##D 
##D # Q-matrix Table 9, p. 357 (Sonnleitner, 2008)
##D Qmatrix <- scan()
##D    1 0 0 0 0 0 0 7 4 0 0 0   0 1 0 0 0 0 0 5 1 0 0 0   1 1 0 1 0 0 0 9 1 0 1 0
##D    1 1 1 0 0 0 0 5 2 0 1 0   1 1 0 0 1 0 0 7 5 1 1 0   1 1 0 0 0 0 0 7 3 0 0 0
##D    0 1 0 0 0 0 2 6 1 0 0 0   0 0 0 0 0 0 2 6 1 0 0 0   1 0 0 0 0 0 1 7 4 1 0 0
##D    0 1 0 0 0 0 0 6 2 1 1 0   0 1 0 0 0 1 0 7 3 1 0 0   0 1 0 0 0 0 0 5 1 0 0 0
##D    0 0 0 0 0 1 0 4 1 0 0 1   0 0 0 0 0 0 0 6 1 0 1 1   0 0 1 0 0 0 0 6 3 0 1 1
##D    0 0 0 1 0 0 1 7 5 0 0 1   0 1 0 0 0 0 1 2 2 0 0 1   0 1 1 0 0 0 1 4 1 0 0 1
##D    0 1 0 0 1 0 0 5 1 0 0 1   0 1 0 0 0 0 1 7 2 0 0 1   0 0 0 0 0 1 0 5 1 0 0 1
##D 
##D Qmatrix <- matrix( as.numeric(Qmatrix), nrow=21, ncol=12, byrow=TRUE )
##D colnames(Qmatrix) <- scan( what="character", nlines=1)
##D    pc ic ier inc iui igc ch nro ncro td a t
##D 
##D # divide Q-matrix entries by maximum in each column
##D Qmatrix <- round(Qmatrix / matrix(apply(Qmatrix,2,max),21,12,byrow=TRUE),3)
##D # LSDM analysis
##D res <- sirt::lsdm( b=b, Qmatrix=Qmatrix )
##D summary(res)
##D   ##
##D   ##   Model Fit LSDM   -  Mean MAD:  0.217     Median MAD:  0.178
##D   ##   Model Fit LLTM   -  Mean MAD:  0.087     Median MAD:  0.062    R^2=0.785
## End(Not run)



