library(mratios)


### Name: sci.ratio.gen
### Title: Simultaneous confidence intervals for ratios of coefficients in
###   the general linear model
### Aliases: sci.ratio.gen
### Keywords: htest

### ** Examples


################################################

# Slope-ratio assay on data from Jensen(1989),
# Biometrical Journal 31, 841-853.

# Definition of the vector of responses and
# the design matrix can be done directly as
# follows:

Y0 <- c(1.3, 1.7, 2.4, 2.7, 3.6, 3.6, 4.7, 5.0, 6.1, 6.3)
Y1 <- c(2.8, 2.9, 4.1, 3.7, 5.5, 5.5, 6.4, 6.7)
Y2 <- c(2.2, 2.1, 3.2, 3.2, 3.8, 3.9, 4.7, 4.9)
Y3 <- c(2.3, 2.3, 3.2, 3.0, 4.2, 4.2, 4.6, 5.1)
Y <- c(Y0,Y1,Y2,Y3) # the response vector

xi <- rep(1,34)
x0 <- c(0,0, gl(4,2),rep(0,8*3))
x1 <- c(rep(0,10),gl(4,2), rep(0,8*2))
x2 <- c(rep(0,18),gl(4,2), rep(0,8))
x3 <- c(rep(0,26),gl(4,2))

X <- cbind(xi,x0,x1,x2,x3) # the design matrix

# Have a look at the response vector:
Y

# and the design matrix:

X

# Internally in sci.ratio.gen, the following model is fitted
 
Fiti <- lm(Y ~ X - 1)
Fiti
summary(Fiti)

# In this problem, interest is simultaneous estimation of
# the ratios of slopes relative to the slope of the standard
# treatment. Therefore, the appropriate contrast matrices are:

Num.Contrast <- matrix(c(0,0,1,0,0,
                         0,0,0,1,0,
                         0,0,0,0,1),nrow=3,byrow=TRUE)
Den.Contrast <- matrix(c(0,1,0,0,0,
                         0,1,0,0,0,
                         0,1,0,0,0),nrow=3,byrow=TRUE)



SlopeRatioCI <- sci.ratio.gen(Y=Y, X=X,
 Num.Contrast=Num.Contrast, Den.Contrast=Den.Contrast)

SlopeRatioCI

# Further details of the fitted model and the contrasts used:

summary(SlopeRatioCI)

plot(SlopeRatioCI)


#########################################################

## Not run: 
##D 
##D # If one starts with a dataframe, the function model.matrix
##D # can be used to create the design matrix:
##D 
##D data(SRAssay)
##D SRAssay
##D 
##D # Create the design matrix using model.matrix
##D 
##D X <- model.matrix(Response~Treatment:Dose, data=SRAssay)
##D Response <- SRAssay[,"Response"]
##D 
##D # The response vector and the design matrix are now:
##D 
##D X
##D Response
##D 
##D # The following coefficients result from fitting this model:
##D 
##D lm(Response~0+X)
##D 
##D # The same contrasts as above are used:
##D 
##D Num.Contrast <- matrix(c(0,0,1,0,0,
##D                          0,0,0,1,0,
##D                          0,0,0,0,1),nrow=3,byrow=TRUE)
##D Den.Contrast <- matrix(c(0,1,0,0,0,
##D                          0,1,0,0,0,
##D                          0,1,0,0,0),nrow=3,byrow=TRUE)
##D 
##D summary(sci.ratio.gen(Y=Response, X=X, Num.Contrast, Den.Contrast))
##D 
## End(Not run)



