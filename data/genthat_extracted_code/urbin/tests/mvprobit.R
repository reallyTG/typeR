library( "urbin" )
library( "maxLik" )
library( "mvProbit" )
options( digits = 2 )

# load data set
data( "Mroz87", package = "sampleSelection" )

# create dummy variable for husband is moonlightning
Mroz87$husMoonlight <- Mroz87$hushrs > 2500

# create dummy variable for kids
Mroz87$kids <- as.numeric( Mroz87$kids5 > 0 | Mroz87$kids618 > 0 )

### linear in age
estMvProbitLin <- mvProbit( cbind( lfp, husMoonlight ) ~ kids + age + educ,
  data = Mroz87, nGHK = 300, iterlim = 0, oneSidedGrad = TRUE, eps = 1e-4,
  start = c( -0.07332, -0.31572, -0.01915, 0.10475,
    -0.70550, 0.09776, -0.00889, 0.03258, -0.10837 ) )
summary( estMvProbitLin )
# mean values of the explanatory variables
xMeanLin <- c( 1, colMeans( Mroz87[ , c( "kids", "age", "educ" ) ] ) )
# semi-elasticity of age without standard errors
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, xPos = 3, model = "probit" )
# semi-elasticity of age based on numerical derivation
Mroz87Lower <- as.data.frame( t( xMeanLin * c( 1, 1, 0.995, 1 ) ) )
Mroz87Upper <- as.data.frame( t( xMeanLin * c( 1, 1, 1.005, 1 ) ) )
Mroz87Lower$lfp <- Mroz87Upper$lfp <- 1
Mroz87Lower$husMoonlight <- Mroz87Upper$husMoonlight <- 1
100 * ( mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + educ,
  coef = coef( estMvProbitLin ), data = Mroz87Upper ) -
    mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + educ,
      coef = coef( estMvProbitLin ), data = Mroz87Lower ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, 3, model = "probit",
  seSimplify = FALSE )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estMvProbitLin )[1:4],
  allXVal = xMeanLin, xPos = 3, model = "probit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, 3, model = "probit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, 3, model = "probit",
  vcov( estMvProbitLin )[1:4,1:4] )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, 3, model = "probit",
  sqrt( diag( vcov( estMvProbitLin ) ) )[1:4], seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estMvProbitLin )[1:4], xMeanLin, 3, model = "probit",
  sqrt( diag( vcov( estMvProbitLin ) ) )[1:4] )
# semi-elasticity of age based on partial derivative calculated by the mfx package
estMvProbitLinME <- margEff( estMvProbitLin,
  data = as.data.frame( t( xMeanLin ) ), calcVCov = TRUE, eps = 1e-4 )
estMvProbitLinME[[ "d_y1_d_age" ]] * xMeanLin[ "age" ]
estMvProbitLinMEVcov <- attr( estMvProbitLinME, "vcov" )[ 1, , ]
urbinEla( estMvProbitLinME[[ "d_y1_d_age" ]], xMeanLin["age"], 1, iPos = 0,
  model = "lpm", sqrt( estMvProbitLinMEVcov[ "d_y1_d_age", "d_y1_d_age" ] ) )
urbinEla( unlist( estMvProbitLinME[ c( 1, 3, 5 ) ] ), xMeanLin[-1], 2, iPos = 0,
  model = "lpm", estMvProbitLinMEVcov[ c( 1, 3, 5 ), c( 1, 3, 5 ) ] )


### quadratic in age
estMvProbitQuad <- mvProbit(
  cbind( lfp, husMoonlight ) ~ kids + age + I(age^2) + educ,
  data = Mroz87, nGHK = 300, iterlim = 0, oneSidedGrad = TRUE, eps = 1e-4,
  start = c( -4.336110, -0.438580, 0.192469, -0.002497, 0.107107,
    0.547970, 0.134075, -0.071620, 0.000741, 0.032548, -0.103104 ) )
summary( estMvProbitQuad )
# mean values of the explanatory variables
xMeanQuad <- c( xMeanLin[ 1:3], xMeanLin[3]^2, xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit" )
# semi-elasticity of age based on numerical derivation
100 * ( mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + I(age^2) + educ,
  coef = coef( estMvProbitQuad ), data = Mroz87Upper ) -
    mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + I(age^2) + educ,
      coef = coef( estMvProbitQuad ), data = Mroz87Lower ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  seSimplify = FALSE )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estMvProbitQuad )[1:5],
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "probit" )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  seSimplify = TRUE )$derivCoef
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  vcov( estMvProbitQuad )[1:5,1:5] )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estMvProbitQuad ) ) )[1:5], seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estMvProbitQuad ) ) )[1:5] )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd)
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estMvProbitQuad ) ) )[1:5],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd, simplified)
urbinEla( coef( estMvProbitQuad )[1:5], xMeanQuad, c( 3, 4 ), model = "probit",
  sqrt( diag( vcov( estMvProbitQuad ) ) )[1:5],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
estMvProbitQuadME <- margEff( estMvProbitQuad,
  data = as.data.frame( t( xMeanQuad ) ), calcVCov = TRUE, eps = 1e-4 )
estMvProbitQuadME[[ "d_y1_d_age" ]] * xMeanQuad[ "age" ] +
  2 * estMvProbitQuadME[[ "d_y1_d_I(age^2)" ]] * xMeanQuad[ "age" ]^2
estMvProbitQuadMEVcov <- attr( estMvProbitQuadME, "vcov" )[ 1, , ]
urbinEla( unlist( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ] ),
  xMeanQuad["age"], 1:2, iPos = 0, model = "lpm",
  estMvProbitQuadMEVcov[ c( 3, 5 ), c( 3, 5 ) ] )
urbinEla( unlist( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ] ), xMeanQuad[-1],
  2:3, iPos = 0, model = "lpm",
  estMvProbitQuadMEVcov[ c( 1, 3, 5, 7 ), c( 1, 3, 5, 7 ) ] )
urbinEla( unlist( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ] ),
  xMeanQuad["age"], 1:2, iPos = 0, model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 3, 5 ) ] )
urbinEla( unlist( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ] ), xMeanQuad[-1],
  2:3, iPos = 0, model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 1, 3, 5, 7 ) ] )
urbinEla( unlist( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ] ),
  xMeanQuad["age"], 1:2, iPos = 0, model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 3, 5 ) ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEla( unlist( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ] ), xMeanQuad[-1],
  2:3, iPos = 0, model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 1, 3, 5, 7 ) ],
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
estMvProbitInt <- mvProbit(
  cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
  data = Mroz87, nGHK = 300, iterlim = 0, oneSidedGrad = TRUE, eps = 1e-4,
  start = c( -0.8929, -0.3775, 0.1346, 0.1219, -0.5144, 0.1082,
    -1.3155, 0.0883, 0.3853, 0.2785, 0.2929, 0.0326, -0.1018 ) )
summary( estMvProbitInt )
# mean values of the explanatory variables
xMeanInt <- c( xMeanLin[1:2], mean( Mroz87$age30.37 ),
  mean( Mroz87$age38.44 ), mean( Mroz87$age53.60 ), xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinElaInt( coef( estMvProbitInt )[1:6], xMeanInt,
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
10 * colMeans(
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = Mroz87Upper ) -
      mvProbitExp(
        cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
        coef = coef( estMvProbitInt ), data = Mroz87Lower ) )
Mroz87LowerMean <- Mroz87Lower
Mroz87UpperMean <- Mroz87Upper
Mroz87LowerMean$kids <- Mroz87UpperMean$kids <- xMeanInt[ "kids" ]
Mroz87LowerMean$educ <- Mroz87UpperMean$educ <- xMeanInt[ "educ" ]
10 * colMeans(
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = Mroz87UpperMean ) -
    mvProbitExp(
      cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
      coef = coef( estMvProbitInt ), data = Mroz87LowerMean ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinElaInt( coef( estMvProbitInt )[1:6], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla },
  t0 = coef( estMvProbitInt )[1:6], allXVal = xMeanInt,
  xPos = c( 3, 4, 0, 5 ), xBound = c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit" )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinElaInt( coef( estMvProbitInt )[1:6], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit", vcov( estMvProbitInt )[1:6,1:6] )
# semi-elasticity of age with standard errors (only standard errors)
urbinElaInt( coef( estMvProbitInt )[1:6], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ),
  model = "probit", sqrt( diag( vcov( estMvProbitInt ) ) )[1:6] )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
names( xMeanInt )[3:5] <- c( "age30.37", "age38.44", "age53.60" )
estMvProbitIntME <- margEff( estMvProbitInt,
  data = as.data.frame( t( xMeanInt ) ), calcVCov = TRUE, eps = 1e-4,
  dummyVars = names( xMeanInt )[3:5] )
estMvProbitIntMEVcov <- attr( estMvProbitIntME, "vcov" )[ 1, , ]
urbinElaInt( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ), xMeanInt[ 3:5 ],
  c( 1, 2, 0, 3 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 3, 5, 7 ), c( 3, 5, 7 ) ] )
urbinElaInt( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ), xMeanInt[-1],
  c( 2, 3, 0, 4 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 1, 3, 5, 7, 9 ), c( 1, 3, 5, 7, 9 ) ] )
urbinElaInt( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ), xMeanInt[ 3:5 ],
  c( 1, 2, 0, 3 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 3, 5, 7 ) ] )
urbinElaInt( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ), xMeanInt[-1],
  c( 2, 3, 0, 4 ), iPos = 0, c( 30, 37.5, 44.5, 52.5, 60 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 1, 3, 5, 7, 9 ) ] )


### effect of age changing between discrete intervals
### if age is used as linear explanatory variable
# mean values of the 'other' explanatory variables
xMeanLinInt <- c( xMeanLin[ 1:2 ], NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estMvProbitLin )[1:4], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
Mroz87Ref <- as.data.frame( t( xMeanLin ) )
Mroz87Int <- as.data.frame( t( xMeanLin ) )
Mroz87Ref$age <- 35
Mroz87Int$age <- 55
Mroz87Ref$lfp <- Mroz87Int$lfp <- 1
Mroz87Ref$husMoonlight <- Mroz87Int$husMoonlight <- 1
mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + educ,
  coef = coef( estMvProbitLin ), data = Mroz87Int ) -
    mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + educ,
      coef = coef( estMvProbitLin ), data = Mroz87Ref )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEffInt( coef( estMvProbitLin )[1:4], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estMvProbitLin )[1:4],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estMvProbitLin )[1:4], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = vcov( estMvProbitLin )[1:4,1:4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estMvProbitLin )[1:4], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estMvProbitLin ) ) )[1:4] )
# semi-elasticity of age based on marginal effects
urbinEffInt( estMvProbitLinME[ "d_y1_d_age" ], NULL, 1, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( estMvProbitLinMEVcov[ "d_y1_d_age", "d_y1_d_age" ] ) )
urbinEffInt( estMvProbitLinME[ c( 1, 3, 5 ) ], NULL, 2, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estMvProbitLinMEVcov[ c( 1, 3, 5 ), c( 1, 3, 5 ) ] )
urbinEffInt( estMvProbitLinME[ c( 1, 3, 5 ) ], NULL, 2, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( diag( estMvProbitLinMEVcov ) )[ c( 1, 3, 5 ) ] )


### effect of age changing between discrete intervals
### if age is used as linear and quadratic explanatory variable
# mean values of the 'other' explanatory variables
xMeanQuadInt <- c( xMeanLin[ 1:2 ], NA, NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estMvProbitQuad )[1:5], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + I(age^2) + educ,
  coef = coef( estMvProbitQuad ), data = Mroz87Int ) -
  mvProbitExp( cbind( lfp, husMoonlight ) ~ kids + age + I(age^2) + educ,
    coef = coef( estMvProbitQuad ), data = Mroz87Ref )
# partial derivatives of the effect wrt the coefficients
urbinEffInt( coef( estMvProbitQuad )[1:5], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect },
  t0 = coef( estMvProbitQuad )[1:5],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "probit" )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix)
urbinEffInt( coef( estMvProbitQuad )[1:5], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = vcov( estMvProbitQuad )[1:5,1:5] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors)
urbinEffInt( coef( estMvProbitQuad )[1:5], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estMvProbitQuad ) ) )[1:5] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (standard errors + mean value and standard deviation of age)
urbinEffInt( coef( estMvProbitQuad )[1:5], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "probit",
  allCoefVcov = sqrt( diag( vcov( estMvProbitQuad ) )[1:5] ),
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
# semi-elasticity of age based on marginal effects
urbinEffInt( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ],
  NULL, 1:2, iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estMvProbitQuadMEVcov[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ),
    c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ] )
urbinEffInt( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ], NULL, 2:3, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  estMvProbitQuadMEVcov[ c( 1, 3, 5, 7 ), c( 1, 3, 5, 7 ) ] )
urbinEffInt( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ],
  NULL, 1:2, iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ] )
urbinEffInt( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ], NULL, 2:3, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 1, 3, 5, 7 ) ] )
urbinEffInt( estMvProbitQuadME[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ],
  NULL, 1:2, iPos = 0, c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( "d_y1_d_age", "d_y1_d_I(age^2)" ) ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )
urbinEffInt( estMvProbitQuadME[ c( 1, 3, 5, 7 ) ], NULL, 2:3, iPos = 0,
  c( 30, 40 ), c( 50, 60 ), model = "lpm",
  sqrt( diag( estMvProbitQuadMEVcov ) )[ c( 1, 3, 5, 7 ) ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ) )


### grouping and re-basing categorical variables
### effects of age changing from the 30-44 category to the 53-60 category
# without standard errors
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit" )
# effects calculated based on predicted values
df30.37 <- df38.44 <- df45.52 <- df53.60 <-
  as.data.frame( t( c( xMeanInt, lfp = 1, husMoonlight = 1 ) ) )
df30.37[ , 3:5 ] <- c( TRUE, FALSE, FALSE )
df38.44[ , 3:5 ] <- c( FALSE, TRUE, FALSE )
df45.52[ , 3:5 ] <- c( FALSE, FALSE, FALSE )
df53.60[ , 3:5 ] <- c( FALSE, FALSE, TRUE )
mvProbitExp(
  cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
  coef = coef( estMvProbitInt ), data = df53.60 ) -
  sum( Mroz87$age30.37 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = df30.37 ) -
  sum( Mroz87$age38.44 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = df38.44 )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estMvProbitInt )[1:6],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "probit" )
# with full covariance matrix
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit", allCoefVcov = vcov( estMvProbitInt )[1:6,1:6] )
# with standard errors only
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( -1, -1, 1, 0 ),
  model = "probit", allCoefVcov = sqrt( diag( vcov( estMvProbitInt ) ) )[1:6] )
# semi-elasticity of age based on marginal effects
urbinEffCat( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ),
  xMeanInt[ 3:5 ], c(1:3), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 3, 5, 7 ), c( 3, 5, 7 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ),
  xMeanInt[ -1 ], c(2:4), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 1, 3, 5, 7, 9 ), c( 1, 3, 5, 7, 9 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ),
  xMeanInt[ 3:5 ], c(1:3), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 3, 5, 7 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ),
  xMeanInt[ -1 ], c(2:4), iPos = 0, c( -1, -1, 1, 0 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 1, 3, 5, 7, 9 ) ] )

### effects of age changing from the 53-60 category to the 38-52 category
# without standard errors
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit" )
# effects calculated based on predicted values
sum( Mroz87$age38.44 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = df38.44 ) +
  sum( Mroz87$age45.52 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = df45.52 ) -
  mvProbitExp(
    cbind( lfp, husMoonlight ) ~ kids + age30.37 + age38.44 + age53.60 + educ,
    coef = coef( estMvProbitInt ), data = df53.60 )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit" )$derivCoef
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect },
  t0 = coef( estMvProbitInt )[1:6],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ),
  model = "probit" )
# with full covariance matrix
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit", allCoefVcov = vcov( estMvProbitInt )[1:6,1:6] )
# with standard errors only
urbinEffCat( coef( estMvProbitInt )[1:6], xMeanInt, c( 3:5 ), c( 0, 1, -1, 1 ),
  model = "probit", allCoefVcov = sqrt( diag( vcov( estMvProbitInt ) ) )[1:6] )
# semi-elasticity of age based on partial derivative calculated by the mfx package
urbinEffCat( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ),
  xMeanInt[ 3:5 ], c(1:3), iPos = 0, c( 0, 1, -1, 1 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 3, 5, 7 ), c( 3, 5, 7 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ),
  xMeanInt[ -1 ], c(2:4), iPos = 0, c( 0, 1, -1, 1 ), model = "lpm",
  estMvProbitIntMEVcov[ c( 1, 3, 5, 7, 9 ), c( 1, 3, 5, 7, 9 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 3, 5, 7 ) ] ),
  xMeanInt[ 3:5 ], c(1:3), iPos = 0, c( 0, 1, -1, 1 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 3, 5, 7 ) ] )
urbinEffCat( unlist( estMvProbitIntME[ c( 1, 3, 5, 7, 9 ) ] ),
  xMeanInt[ -1 ], c(2:4), iPos = 0, c( 0, 1, -1, 1 ), model = "lpm",
  sqrt( diag( estMvProbitIntMEVcov ) )[ c( 1, 3, 5, 7, 9 ) ] )
