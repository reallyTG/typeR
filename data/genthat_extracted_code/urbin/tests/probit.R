library( "urbin" )
library( "maxLik" )
library( "mfx" )
options( digits = 4 )

# load data set
data( "Mroz87", package = "sampleSelection" )

# create dummy variable for kids
Mroz87$kids <- as.numeric( Mroz87$kids5 > 0 | Mroz87$kids618 > 0 )

### linear in age
estProbitLin <- glm( lfp ~ kids + age + educ,
  family = binomial(link = "probit"),
  data = Mroz87 )
summary( estProbitLin )
# mean values of the explanatory variables
xMeanLin <- c( 1, colMeans( Mroz87[ , c( "kids", "age", "educ" ) ] ) )
# semi-elasticity of age without standard errors
urbinEla( coef( estProbitLin ), xMeanLin, xPos = 3, model = "probit" )
# semi-elasticity of age based on numerical derivation
100 * ( predict( estProbitLin,
  newdata = as.data.frame( t( xMeanLin * c( 1, 1, 1.005, 1 ) ) ),
  type = "response" ) -
    predict( estProbitLin,
      newdata = as.data.frame( t( xMeanLin * c( 1, 1, 0.995, 1 ) ) ),
      type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estProbitLin ), xMeanLin, 3, model = "probit",
  seSimplify = FALSE )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estProbitLin ),
  allXVal = xMeanLin, xPos = 3, model = "probit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estProbitLin ), xMeanLin, 3, model = "probit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estProbitLin ), xMeanLin, 3, model = "probit",
  vcov( estProbitLin ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estProbitLin ), xMeanLin, 3, model = "probit",
  sqrt( diag( vcov( estProbitLin ) ) ), seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estProbitLin ), xMeanLin, 3, model = "probit",
  sqrt( diag( vcov( estProbitLin ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
estProbitLinMfx <- probitmfx( lfp ~ kids + age + educ, data = Mroz87 )
estProbitLinMfx$mfxest[ "age", 1:2 ] * xMeanLin[ "age" ]
urbinEla( estProbitLinMfx$mfxest[ "age", 1 ], xMeanLin["age"], 1, iPos = 0,
  model = "lpm", estProbitLinMfx$mfxest[ "age", 2 ] )
urbinEla( estProbitLinMfx$mfxest[ , 1 ], xMeanLin[-1], 2, iPos = 0,
  model = "lpm", estProbitLinMfx$mfxest[ , 2 ] )


### quadratic in age
estProbitQuad <- glm( lfp ~ kids + age + I(age^2) + educ,
  family = binomial(link = "probit"),
  data = Mroz87 )
summary( estProbitQuad )
# mean values of the explanatory variables
xMeanQuad <- c( xMeanLin[ 1:3], xMeanLin[3]^2, xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit" )
# semi-elasticity of age based on numerical derivation
100 * ( predict( estProbitQuad,
  newdata = as.data.frame( t( xMeanQuad * c( 1, 1, 1.005, 1.005^2, 1 ) ) ),
  type = "response" ) -
    predict( estProbitQuad,
      newdata = as.data.frame( t( xMeanQuad * c( 1, 1, 0.995, 0.995^2, 1 ) ) ),
      type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  seSimplify = FALSE )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estProbitQuad ),
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "probit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  vcov( estProbitQuad ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estProbitQuad ) ) ), seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estProbitQuad ) ) ) )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estProbitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd, simplified)
urbinEla( coef( estProbitQuad ), xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estProbitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
# (differs from the above, because mean(age)^2 is not the same as mean(age^2))
estProbitQuadMfx <- probitmfx( lfp ~ kids + age + I(age^2) + educ, data = Mroz87 )
estProbitQuadMfx$mfxest[ "age", 1:2 ] * xMeanQuad[ "age" ] +
  2 * estProbitQuadMfx$mfxest[ "I(age^2)", 1:2 ] * xMeanQuad[ "age" ]^2
urbinEla( estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ],
  xMeanQuad["age"], 1:2, iPos = 0,
  model = "lpm", estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ] )
urbinEla( estProbitQuadMfx$mfxest[ , 1 ],
  xMeanQuad[-1], 2:3, iPos = 0,
  model = "lpm", estProbitQuadMfx$mfxest[ , 2 ] )
urbinEla( estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ],
  xMeanQuad["age"], 1:2, iPos = 0,
  model = "lpm", estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEla( estProbitQuadMfx$mfxest[ , 1 ],
  xMeanQuad[-1], 2:3, iPos = 0,
  model = "lpm", estProbitQuadMfx$mfxest[ , 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )


### age is interval-coded (age is in the range 30-60)
# create dummy variables for age intervals
Mroz87$age30.37 <- Mroz87$age >= 30 & Mroz87$age <= 37
Mroz87$age38.44 <- Mroz87$age >= 38 & Mroz87$age <= 44
Mroz87$age45.52 <- Mroz87$age >= 45 & Mroz87$age <= 52
Mroz87$age53.60 <- Mroz87$age >= 53 & Mroz87$age <= 60
all.equal(
  Mroz87$age30.37 + Mroz87$age38.44 + Mroz87$age45.52 + Mroz87$age53.60,
  rep( 1, nrow( Mroz87 ) ) )
# estimation
estProbitInt <- glm( lfp ~ kids + age30.37 + age38.44 + age53.60 + educ,
  family = binomial(link = "probit"),
  data = Mroz87 )
summary( estProbitInt )
# mean values of the explanatory variables
xMeanInt <- c( xMeanLin[1:2], mean( Mroz87$age30.37 ),
  mean( Mroz87$age38.44 ), mean( Mroz87$age53.60 ), xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinElaInt( coef( estProbitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "probit" )
# semi-elasticities based on numerical derivation
Mroz87Lower <- Mroz87
Mroz87Lower$age <- Mroz87$age * 0.95
Mroz87Lower$age30.37 <- Mroz87Lower$age <= 37.5
Mroz87Lower$age38.44 <- Mroz87Lower$age > 37.5 & Mroz87Lower$age <= 44.5
Mroz87Lower$age45.52 <- Mroz87Lower$age > 44.5 & Mroz87Lower$age <= 52.5
Mroz87Lower$age53.60 <- Mroz87Lower$age > 52.5
all.equal(
  Mroz87Lower$age30.37 + Mroz87Lower$age38.44 + Mroz87Lower$age45.52 +
    Mroz87Lower$age53.60, rep( 1, nrow( Mroz87 ) ) )
Mroz87Upper <- Mroz87
Mroz87Upper$age <- Mroz87$age * 1.05
Mroz87Upper$age30.37 <- Mroz87Upper$age <= 37.5
Mroz87Upper$age38.44 <- Mroz87Upper$age > 37.5 & Mroz87Upper$age <= 44.5
Mroz87Upper$age45.52 <- Mroz87Upper$age > 44.5 & Mroz87Upper$age <= 52.5
Mroz87Upper$age53.60 <- Mroz87Upper$age > 52.5
all.equal(
  Mroz87Upper$age30.37 + Mroz87Upper$age38.44 + Mroz87Upper$age45.52 +
    Mroz87Upper$age53.60, rep( 1, nrow( Mroz87 ) ) )
10 * mean( predict( estProbitInt, newdata = Mroz87Upper, type = "response" ) -
    predict( estProbitInt, newdata = Mroz87Lower, type = "response" ) )
Mroz87LowerMean <- Mroz87Lower
Mroz87UpperMean <- Mroz87Upper
Mroz87LowerMean$kids <- Mroz87UpperMean$kids <- xMeanInt[ "kids" ]
Mroz87LowerMean$educ <- Mroz87UpperMean$educ <- xMeanInt[ "educ" ]
10 * mean( predict( estProbitInt, newdata = Mroz87UpperMean, type = "response" ) -
    predict( estProbitInt, newdata = Mroz87LowerMean, type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinElaInt( coef( estProbitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla },
  t0 = coef( estProbitInt ), allXVal = xMeanInt,
  xPos = c( 3, 4, 0, 5 ), xBound = c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit" )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinElaInt( coef( estProbitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit", vcov( estProbitInt ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinElaInt( coef( estProbitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit", sqrt( diag( vcov( estProbitInt ) ) ) )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
estProbitIntMfx <- probitmfx( lfp ~ kids + age30.37 + age38.44 + age53.60 + educ,
  data = Mroz87 )
urbinElaInt( estProbitIntMfx$mfxest[ 2:4, 1 ], xMeanInt[ 3:5 ],
  c( 1, 2, 0, 3 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estProbitIntMfx$mfxest[ 2:4, 2 ] )
urbinElaInt( estProbitIntMfx$mfxest[ , 1 ], xMeanInt[ -1 ],
  c( 2, 3, 0, 4 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estProbitIntMfx$mfxest[ , 2 ] )


### effect of age changing between discrete intervals
### if age is used as linear explanatory variable
# mean values of the 'other' explanatory variables
xMeanLinInt <- c( xMeanLin[ 1:2 ], NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estProbitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
predict( estProbitLin,
  newdata = as.data.frame( t( replace( xMeanLin, 3, 55 ) ) ),
  type = "response" ) -
  predict( estProbitLin,
    newdata = as.data.frame( t( replace( xMeanLin, 3, 35 ) ) ),
    type = "response" )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEffInt( coef( estProbitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estProbitLin ),
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estProbitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = vcov( estProbitLin ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estProbitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estProbitLin ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffInt( estProbitLinMfx$mfxest[ "age", 1 ], NULL, 1, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitLinMfx$mfxest[ "age", 2 ] )
urbinEffInt( estProbitLinMfx$mfxest[ , 1 ], NULL, 2, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitLinMfx$mfxest[ , 2 ] )


### effect of age changing between discrete intervals
### if age is used as linear and quadratic explanatory variable
# mean values of the 'other' explanatory variables
xMeanQuadInt <- c( xMeanLin[ 1:2 ], NA, NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estProbitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
predict( estProbitQuad,
  newdata = as.data.frame( t( replace( xMeanQuad, 3:4, c( 55, 55^2 ) ) ) ),
  type = "response" ) -
  predict( estProbitQuad,
    newdata = as.data.frame( t( replace( xMeanQuad, 3:4, c( 35, 35^2 ) ) ) ),
    type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffInt( coef( estProbitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estProbitQuad ),
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estProbitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = vcov( estProbitQuad ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estProbitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estProbitQuad ) ) ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (standard errors + mean value and standard deviation of age)
urbinEffInt( coef( estProbitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estProbitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffInt( estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ], NULL, 1:2,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ] )
urbinEffInt( estProbitQuadMfx$mfxest[ , 1 ], NULL, 2:3,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitQuadMfx$mfxest[ , 2 ] )
urbinEffInt( estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ], NULL, 1:2,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEffInt( estProbitQuadMfx$mfxest[ , 1 ], NULL, 2:3,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estProbitQuadMfx$mfxest[ , 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )


### grouping and re-basing categorical variables
### effects of age changing from the 30-44 category to the 53-60 category
# without standard errors
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit" )
# effects calculated based on predicted values
names( xMeanInt ) <- sub( "TRUE", "", names( coef( estProbitInt ) ) )
df30.37 <- df38.44 <- df45.52 <- df53.60 <- as.data.frame( t( xMeanInt ) )
df30.37[ , 3:5 ] <- c( TRUE, FALSE, FALSE )
df38.44[ , 3:5 ] <- c( FALSE, TRUE, FALSE )
df45.52[ , 3:5 ] <- c( FALSE, FALSE, FALSE )
df53.60[ , 3:5 ] <- c( FALSE, FALSE, TRUE )
predict( estProbitInt, newdata = df53.60, type = "response" ) -
  sum( Mroz87$age30.37 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estProbitInt, newdata = df30.37, type = "response" ) -
  sum( Mroz87$age38.44 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estProbitInt, newdata = df38.44, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estProbitInt ),
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "probit" )
# with full covariance matrix
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit", allCoefVcov = vcov( estProbitInt ) )
# with standard errors only
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit", allCoefVcov = sqrt( diag( vcov( estProbitInt ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffCat( estProbitIntMfx$mfxest[ 2:4, 1 ],
  xMeanInt[ 3:5 ], c(1:3), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  estProbitIntMfx$mfxest[ 2:4, 2 ] )
urbinEffCat( estProbitIntMfx$mfxest[ , 1 ],
  xMeanInt[ -1 ], c(2:4), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  estProbitIntMfx$mfxest[ , 2 ] )

### effects of age changing from the 53-60 category to the 38-52 category
# without standard errors
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit" )
# effects calculated based on predicted values
sum( Mroz87$age38.44 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estProbitInt, newdata = df38.44, type = "response" ) +
  sum( Mroz87$age45.52 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estProbitInt, newdata = df45.52, type = "response" ) -
  predict( estProbitInt, newdata = df53.60, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estProbitInt ),
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ),
  model = "probit" )
# with full covariance matrix
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit", allCoefVcov = vcov( estProbitInt ) )
# with standard errors only
urbinEffCat( coef( estProbitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit", allCoefVcov = sqrt( diag( vcov( estProbitInt ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffCat( estProbitIntMfx$mfxest[ 2:4, 1 ], xMeanInt[ 3:5 ], c(1:3),
  c( 0, 1, -1, 1 ), iPos = 0, model = "lpm", estProbitIntMfx$mfxest[ 2:4, 2 ] )
urbinEffCat( estProbitIntMfx$mfxest[ , 1 ], xMeanInt[ -1 ], c(2:4),
  c( 0, 1, -1, 1 ), iPos = 0, model = "lpm", estProbitIntMfx$mfxest[ , 2 ] )

