library(urbin)


### Name: urbin
### Title: Unifying Estimation Results with Binary Dependent Variables
### Aliases: urbinEla urbinElaInt urbinEffInt urbinEffCat
### Keywords: models regression

### ** Examples

# load data set
data( "Mroz87", package = "sampleSelection" )

# create dummy variable for kids
Mroz87$kids <- as.numeric( Mroz87$kids5 > 0 | Mroz87$kids618 > 0 )

# estimate probit model with linear and quadratic age terms
estProbitQuad <- glm( lfp ~ kids + age + I(age^2) + educ, 
  family = binomial(link = "probit"), 
  data = Mroz87 )
summary( estProbitQuad )

# mean values of the explanatory variables
xMeanQuad <- c( 1, mean( Mroz87$kids ), mean( Mroz87$age ), 
  mean( Mroz87$age )^2, mean( Mroz87$educ ) )

# create dummy variables for age intervals
Mroz87$age30.37 <- Mroz87$age >= 30 & Mroz87$age <= 37
Mroz87$age38.44 <- Mroz87$age >= 38 & Mroz87$age <= 44
Mroz87$age45.52 <- Mroz87$age >= 45 & Mroz87$age <= 52
Mroz87$age53.60 <- Mroz87$age >= 53 & Mroz87$age <= 60

# probit estimation with age as interval-coded explanatory variable
estProbitInt <- glm( lfp ~ kids + age30.37 + age38.44 + age53.60 + educ, 
  family = binomial(link = "probit"), 
  data = Mroz87 )
summary( estProbitInt )

# mean values of the explanatory variables
xMeanInt <- c( 1, colMeans( Mroz87[ , 
  c( "kids", "age30.37", "age38.44", "age53.60", "educ" ) ] ) )


##################################################################  
#######################  urbinEla()  #############################
##################################################################  
# semi-elasticity of age (full covariance matrix of coefficients)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  vcov( estProbitQuad ) )

# semi-elasticity of age (standard errors of coefficients,
# mean and standard deviation of age provided, 
# simplified calculation of standard error)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit", 
  sqrt( diag( vcov( estProbitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
  
  
##################################################################  
#####################  urbinElaInt()  ############################
##################################################################  
# semi-elasticity of age (full covariance matrix of coefficients)
urbinElaInt( coef( estProbitInt ), xMeanInt, 
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), 
  model = "probit", vcov( estProbitInt ) )

# semi-elasticity of age (only standard errors of coefficients)
urbinElaInt( coef( estProbitInt ), xMeanInt, 
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), 
  model = "probit", sqrt( diag( vcov( estProbitInt ) ) ) )
 
 
##################################################################  
#####################  urbinEffInt()  ############################
##################################################################  
# effect of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix of coefficients)
urbinEffInt( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  vcov( estProbitQuad ) )
  
# effect of age changing from the 30-40 interval to the 50-60 interval
# (with standard errors of coefficients as well as 
# mean and standard deviation of age) 
urbinEffInt( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit", 
  sqrt( diag( vcov( estProbitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
  
  
##################################################################  
#####################  urbinEffCat()  ############################
##################################################################  
# effect of age changing from 38-52 years (2nd category + reference category) 
# to 53-60 years (3rd category) (with full covariance matrix)
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, -1, 1, -1 ),
  model = "probit", vcov( estProbitInt ) )

# effect of age changing from 38-52 years (2nd category + reference category) 
# to 53-60 years (3rd category) (with standard errors only)
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, -1, 1, -1 ),
  model = "probit", sqrt( diag( vcov( estProbitInt ) ) ) )



