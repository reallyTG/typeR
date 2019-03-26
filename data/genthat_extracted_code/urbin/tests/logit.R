library( "urbin" )
library( "maxLik" )
library( "mfx" )
options( digits = 4 )

# load data set
data( "Mroz87", package = "sampleSelection" )

# create dummy variable for kids
Mroz87$kids <- as.numeric( Mroz87$kids5 > 0 | Mroz87$kids618 > 0 )

### linear in age
estLogitLin <- glm( lfp ~ kids + age + educ,
  family = binomial(link = "logit"),
  data = Mroz87 )
summary( estLogitLin )
# mean values of the explanatory variables
xMeanLin <- c( 1, colMeans( Mroz87[ , c( "kids", "age", "educ" ) ] ) )
# semi-elasticity of age without standard errors
urbinEla( coef( estLogitLin ), xMeanLin, xPos = 3, model = "logit" )
# semi-elasticity of age based on numerical derivation
100 * ( predict( estLogitLin,
  newdata = as.data.frame( t( xMeanLin * c( 1, 1, 1.005, 1 ) ) ),
  type = "response" ) -
    predict( estLogitLin,
      newdata = as.data.frame( t( xMeanLin * c( 1, 1, 0.995, 1 ) ) ),
      type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estLogitLin ), xMeanLin, 3, seSimplify = FALSE,
  model = "logit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estLogitLin ),
  allXVal = xMeanLin, xPos = 3, model = "logit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estLogitLin ), xMeanLin, 3, model = "logit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estLogitLin ), xMeanLin, 3, model = "logit",
  vcov( estLogitLin ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estLogitLin ), xMeanLin, 3, model = "logit",
  sqrt( diag( vcov( estLogitLin ) ) ), seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estLogitLin ), xMeanLin, 3, model = "logit",
  sqrt( diag( vcov( estLogitLin ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
estLogitLinMfx <- logitmfx( lfp ~ kids + age + educ, data = Mroz87 )
estLogitLinMfx$mfxest[ "age", 1:2 ] * xMeanLin[ "age" ]
urbinEla( estLogitLinMfx$mfxest[ "age", 1 ], xMeanLin["age"], 1, iPos = 0,
  model = "lpm", estLogitLinMfx$mfxest[ "age", 2 ] )
urbinEla( estLogitLinMfx$mfxest[ , 1 ], xMeanLin[-1], 2, iPos = 0,
  model = "lpm", estLogitLinMfx$mfxest[ , 2 ] )


### quadratic in age
estLogitQuad <- glm( lfp ~ kids + age + I(age^2) + educ,
  family = binomial(link = "logit"),
  data = Mroz87 )
summary( estLogitQuad )
# mean values of the explanatory variables
xMeanQuad <- c( xMeanLin[ 1:3 ], xMeanLin[3]^2, xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit" )
# semi-elasticity of age based on numerical derivation
100 * ( predict( estLogitQuad,
  newdata = as.data.frame( t( xMeanQuad * c( 1, 1, 1.005, 1.005^2, 1 ) ) ),
  type = "response" ) -
    predict( estLogitQuad,
      newdata = as.data.frame( t( xMeanQuad * c( 1, 1, 0.995, 0.995^2, 1 ) ) ),
      type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  seSimplify = FALSE )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estLogitQuad ),
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "logit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  vcov( estLogitQuad ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  sqrt( diag( vcov( estLogitQuad ) ) ), seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  sqrt( diag( vcov( estLogitQuad ) ) ) )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd)
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  sqrt( diag( vcov( estLogitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd, simplified)
urbinEla( coef( estLogitQuad ), xMeanQuad, c( 3, 4 ), model = "logit",
  sqrt( diag( vcov( estLogitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
# (differs from the above, because mean(age)^2 is not the same as mean(age^2))
estLogitQuadMfx <- logitmfx( lfp ~ kids + age + I(age^2) + educ, data = Mroz87 )
estLogitQuadMfx$mfxest[ "age", 1:2 ] * xMeanQuad[ "age" ] +
  2 * estLogitQuadMfx$mfxest[ "I(age^2)", 1:2 ] * xMeanQuad[ "age" ]^2
urbinEla( estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ],
  xMeanQuad["age"], 1:2, iPos = 0,
  model = "lpm", estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ] )
urbinEla( estLogitQuadMfx$mfxest[  , 1 ],
  xMeanQuad[-1], 2:3, iPos = 0,
  model = "lpm", estLogitQuadMfx$mfxest[ , 2 ] )
urbinEla( estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ],
  xMeanQuad["age"], 1:2, iPos = 0,
  model = "lpm", estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEla( estLogitQuadMfx$mfxest[  , 1 ],
  xMeanQuad[-1], 2:3, iPos = 0,
  model = "lpm", estLogitQuadMfx$mfxest[ , 2 ],
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
estLogitInt <- glm( lfp ~ kids + age30.37 + age38.44 + age53.60 + educ,
  family = binomial(link = "logit"),
  data = Mroz87 )
summary( estLogitInt )
# mean values of the explanatory variables
xMeanInt <- c( xMeanLin[1:2], mean( Mroz87$age30.37 ),
  mean( Mroz87$age38.44 ), mean( Mroz87$age53.60 ), xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinElaInt( coef( estLogitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "logit" )
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
10 * mean( predict( estLogitInt, newdata = Mroz87Upper, type = "response" ) -
  predict( estLogitInt, newdata = Mroz87Lower, type = "response" ) )
Mroz87LowerMean <- Mroz87Lower
Mroz87UpperMean <- Mroz87Upper
Mroz87LowerMean$kids <- Mroz87UpperMean$kids <- xMeanInt[ "kids" ]
Mroz87LowerMean$educ <- Mroz87UpperMean$educ <- xMeanInt[ "educ" ]
10 * mean( predict( estLogitInt, newdata = Mroz87UpperMean, type = "response" ) -
    predict( estLogitInt, newdata = Mroz87LowerMean, type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinElaInt( coef( estLogitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "logit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla },
  t0 = coef( estLogitInt ), allXVal = xMeanInt,
  xPos = c( 3, 4, 0, 5 ), xBound = c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "logit" )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinElaInt( coef( estLogitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "logit",
  allCoefVcov = vcov( estLogitInt ) )
# semi-elasticity of age with standard errors (only standard errors)
urbinElaInt( coef( estLogitInt ), xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "logit",
  allCoefVcov = sqrt( diag( vcov( estLogitInt ) ) ) )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
estLogitIntMfx <- logitmfx( lfp ~ kids + age30.37 + age38.44 + age53.60 + educ,
  data = Mroz87 )
urbinElaInt( estLogitIntMfx$mfxest[ 2:4, 1 ], xMeanInt[ 3:5 ],
  c( 1, 2, 0, 3 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estLogitIntMfx$mfxest[ 2:4, 2 ] )
urbinElaInt( estLogitIntMfx$mfxest[ , 1 ], xMeanInt[ -1 ],
  c( 2, 3, 0, 4 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estLogitIntMfx$mfxest[ , 2 ] )


### effect of age changing between discrete intervals
### if age is used as linear explanatory variable
# mean values of the 'other' explanatory variables
xMeanLinInt <- c( xMeanLin[ 1:2 ], NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estLogitLin ), allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "logit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
predict( estLogitLin,
  newdata = as.data.frame( t( replace( xMeanLin, 3, 55 ) ) ),
  type = "response" ) -
  predict( estLogitLin,
    newdata = as.data.frame( t( replace( xMeanLin, 3, 35 ) ) ),
    type = "response" )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEffInt( coef( estLogitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "logit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estLogitLin ),
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "logit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estLogitLin ), xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "logit", allCoefVcov = vcov( estLogitLin ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estLogitLin ), allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "logit",
  allCoefVcov = sqrt( diag( vcov( estLogitLin ) ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffInt( estLogitLinMfx$mfxest[ "age", 1 ], NULL, 1, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitLinMfx$mfxest[ "age", 2 ] )
urbinEffInt( estLogitLinMfx$mfxest[ , 1 ], NULL, 2, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitLinMfx$mfxest[ , 2 ] )


### effect of age changing between discrete intervals
### if age is used as linear and quadratic explanatory variable
# mean values of the 'other' explanatory variables
xMeanQuadInt <- c( xMeanLin[ 1:2 ], NA, NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estLogitQuad ), allXVal = xMeanQuadInt,
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ),
  model = "logit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
predict( estLogitQuad,
  newdata = as.data.frame( t( replace( xMeanQuad, 3:4, c( 55, 55^2 ) ) ) ),
  type = "response" ) -
  predict( estLogitQuad,
    newdata = as.data.frame( t( replace( xMeanQuad, 3:4, c( 35, 35^2 ) ) ) ),
    type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffInt( coef( estLogitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "logit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estLogitQuad ),
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "logit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estLogitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "logit",
  allCoefVcov = vcov( estLogitQuad ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estLogitQuad ), allXVal = xMeanQuadInt,
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ),
  model = "logit", allCoefVcov = sqrt( diag( vcov( estLogitQuad ) ) ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (standard errors + mean value and standard deviation of age)
urbinEffInt( coef( estLogitQuad ), xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "logit",
  allCoefVcov = sqrt( diag( vcov( estLogitQuad ) ) ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffInt( estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ], NULL, 1:2,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ] )
urbinEffInt( estLogitQuadMfx$mfxest[ , 1 ], NULL, 2:3,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitQuadMfx$mfxest[ , 2 ] )
urbinEffInt( estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 1 ], NULL, 1:2,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitQuadMfx$mfxest[ c( "age", "I(age^2)" ), 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEffInt( estLogitQuadMfx$mfxest[ , 1 ], NULL, 2:3,
  iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estLogitQuadMfx$mfxest[ , 2 ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )


### grouping and re-basing categorical variables
### effects of age changing from the 30-44 category to the 53-60 category
# without standard errors
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "logit" )
# effects calculated based on predicted values
names( xMeanInt ) <- sub( "TRUE", "", names( coef( estLogitInt ) ) )
df30.37 <- df38.44 <- df45.52 <- df53.60 <- as.data.frame( t( xMeanInt ) )
df30.37[ , 3:5 ] <- c( TRUE, FALSE, FALSE )
df38.44[ , 3:5 ] <- c( FALSE, TRUE, FALSE )
df45.52[ , 3:5 ] <- c( FALSE, FALSE, FALSE )
df53.60[ , 3:5 ] <- c( FALSE, FALSE, TRUE )
predict( estLogitInt, newdata = df53.60, type = "response" ) -
  sum( Mroz87$age30.37 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estLogitInt, newdata = df30.37, type = "response" ) -
  sum( Mroz87$age38.44 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estLogitInt, newdata = df38.44, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ),
  c( -1, -1, 1, 0 ), model = "logit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estLogitInt ),
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "logit" )
# with full covariance matrix
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  allCoefVcov = vcov( estLogitInt ), model = "logit" )
# with standard errors only
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  allCoefVcov = sqrt( diag( vcov( estLogitInt ) ) ), model = "logit" )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffCat( estLogitIntMfx$mfxest[ 2:4, 1 ], xMeanInt[ 3:5 ], c(1:3),
  c( -1, -1, 1, 0 ), iPos = 0, model = "lpm", estLogitIntMfx$mfxest[ 2:4, 2 ] )
urbinEffCat( estLogitIntMfx$mfxest[ , 1 ], xMeanInt[ -1 ], c(2:4),
  c( -1, -1, 1, 0 ), iPos = 0, model = "lpm", estLogitIntMfx$mfxest[ , 2 ] )

### effects of age changing from the 53-60 category to the 38-52 category
# without standard errors
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "logit" )
# effects calculated based on predicted values
sum( Mroz87$age38.44 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estLogitInt, newdata = df38.44, type = "response" ) +
  sum( Mroz87$age45.52 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estLogitInt, newdata = df45.52, type = "response" ) -
  predict( estLogitInt, newdata = df53.60, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ),
  c( 0, 1, -1, 1 ), model = "logit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estLogitInt ),
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ),
  model = "logit" )
# with full covariance matrix
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  allCoefVcov = vcov( estLogitInt ), model = "logit" )
# with standard errors only
urbinEffCat( coef( estLogitInt ), xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  allCoefVcov = sqrt( diag( vcov( estLogitInt ) ) ), model = "logit" )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffCat( estLogitIntMfx$mfxest[ 2:4, 1 ], xMeanInt[ 3:5 ], c(1:3),
  c( 0, 1, -1, 1 ), iPos = 0, model = "lpm", estLogitIntMfx$mfxest[ 2:4, 2 ] )
urbinEffCat( estLogitIntMfx$mfxest[ , 1 ], xMeanInt[ -1 ], c(2:4),
  c( 0, 1, -1, 1 ), iPos = 0, model = "lpm", estLogitIntMfx$mfxest[ , 2 ] )

