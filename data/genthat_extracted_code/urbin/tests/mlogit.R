library( "urbin" )
library( "maxLik" )
library( "mlogit" )
options( digits = 4 )

# load data set
data( "Mroz87", package = "sampleSelection" )

# create dummy variable for kids
Mroz87$kids <- as.numeric( Mroz87$kids5 > 0 | Mroz87$kids618 > 0 )

### create categorical variable
Mroz87$lfp3 <- factor( ifelse( Mroz87$hours == 0, "no",
  ifelse( Mroz87$hours <= 1300, "part", "full" ) ),
  levels = c( "no", "part", "full" ) )
table( Mroz87$lfp3 )
all.equal( Mroz87$lfp3 == "no", Mroz87$lfp == 0 )

### linear in age
estMLogitLin <- mlogit( lfp3 ~ 0 | kids + age + educ, data = Mroz87,
  reflevel = "no", shape = "wide" )
summary( estMLogitLin )
# vector for permuting coefficients so that they are ordered in the same way 
# as expected by urbinEla()
coefPermuteLin <- c( seq( 1, 7, 2 ), seq( 2, 8, 2 ) )
# mean values of the explanatory variables
xMeanLin <- c( 1, colMeans( Mroz87[ , c( "kids", "age", "educ" ) ] ) )
# semi-elasticity of age without standard errors
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3, 
  model = "mlogit", yCat = 0 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3, 
  model = "mlogit", yCat = 1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3, 
  model = "mlogit", yCat = 2 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3, 
  model = "mlogit", yCat = 0:1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3, 
  model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, xPos = 3,
    model = "mlogit", yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ),
  check.attributes = FALSE )
# semi-elasticity of age based on numerical derivation
Mroz87Lower <- as.data.frame( t( xMeanLin * c( 1, 1, 0.995, 1 ) ) )
Mroz87Lower$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mLower <- mlogit.data( Mroz87Lower, shape = "wide", 
  choice = "lfp3" )
Mroz87Upper <- as.data.frame( t( xMeanLin * c( 1, 1, 1.005, 1 ) ) )
Mroz87Upper$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mUpper <- mlogit.data( Mroz87Upper, shape = "wide", 
  choice = "lfp3" )
100 * ( predict( estMLogitLin, newdata = Mroz87mUpper, type = "response" ) -
    predict( estMLogitLin, newdata = Mroz87mLower, type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  seSimplify = FALSE, model = "mlogit", yCat = 0 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  seSimplify = FALSE, model = "mlogit", yCat = 1 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  seSimplify = FALSE, model = "mlogit", yCat = 2 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  seSimplify = FALSE, model = "mlogit", yCat = 0:1 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  seSimplify = FALSE, model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 8 ),
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3,
    seSimplify = FALSE, model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ], 
  allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ], 
  allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estMLogitLin )[ coefPermuteLin ], 
  allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estMLogitLin )[ coefPermuteLin ], 
  allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
  t0 = coef( estMLogitLin )[ coefPermuteLin ], 
  allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 8 ), c( 
  numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla },
    t0 = coef( estMLogitLin )[ coefPermuteLin ], 
    allXVal = xMeanLin, xPos = 3, model = "mlogit", yCat = 0:2 ) ) )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  model = "mlogit", seSimplify = TRUE, yCat = 0 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  model = "mlogit", seSimplify = TRUE, yCat = 1 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  model = "mlogit", seSimplify = TRUE, yCat = 2 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  model = "mlogit", seSimplify = TRUE, yCat = 0:1 )$derivCoef
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, 
  model = "mlogit", seSimplify = TRUE, yCat = 1:2 )$derivCoef
all.equal( rep( 0, 8 ),
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3,
    model = "mlogit", seSimplify = TRUE, yCat = 0:2 )$derivCoef )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 0 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 2 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 0:1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
    vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], yCat = 0:2 )[
      c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
  yCat = 0 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
  yCat = 1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
  yCat = 2 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
  yCat = 0:1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit",
    sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], seSimplify = FALSE, 
    yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 0 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 2 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 0:1 )
urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
  sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitLin )[ coefPermuteLin ], xMeanLin, 3, model = "mlogit", 
    sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ], yCat = 0:2 )[ 
      c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )

### quadratic in age
estMLogitQuad <- mlogit( lfp3 ~ 0 | kids + age + I(age^2) + educ, 
  data = Mroz87, reflevel = "no", shape = "wide" )
summary( estMLogitQuad )
# vector for permuting coefficients so that they are ordered in the same way 
# as expected by urbinEla()
coefPermuteQuad <- c( seq( 1, 9, 2 ), seq( 2, 10, 2 ) )
# mean values of the explanatory variables
xMeanQuad <- c( xMeanLin[ 1:3 ], xMeanLin[3]^2, xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), 
  check.attributes = FALSE )
# semi-elasticity of age based on numerical derivation
Mroz87Lower <- as.data.frame( 
  t( xMeanQuad * c( 1, 1, 0.995, 0.995^2, 1 ) ) )
Mroz87Lower$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mLower <- mlogit.data( Mroz87Lower, shape = "wide", 
  choice = "lfp3" )
Mroz87Upper <- as.data.frame( 
  t( xMeanQuad * c( 1, 1, 1.005, 1.005^2, 1 ) ) )
Mroz87Upper$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mUpper <- mlogit.data( Mroz87Upper, shape = "wide", 
  choice = "lfp3" )
100 * ( predict( estMLogitQuad, newdata = Mroz87mUpper, type = "response" ) -
    predict( estMLogitQuad, newdata = Mroz87mLower, type = "response" ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = FALSE, yCat = 0 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = FALSE, yCat = 1 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = FALSE, yCat = 2 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = FALSE, yCat = 0:1 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = FALSE, yCat = 1:2 )$derivCoef
all.equal( rep( 0, 10 ),
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", seSimplify = FALSE, yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
  allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 10 ), c(
  numericGradient( function( x, ... ){ urbinEla( x, ... )$semEla }, 
    t0 = coef( estMLogitQuad )[ coefPermuteQuad ], 
    allXVal = xMeanQuad, xPos = c( 3, 4 ), model = "mlogit", yCat = 0:2 ) ) )
# simplified partial derivatives of the semi-elasticity wrt the coefficients
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = TRUE, yCat = 0 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = TRUE, yCat = 1 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = TRUE, yCat = 2 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = TRUE, yCat = 0:1 )$derivCoef
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", seSimplify = TRUE, yCat = 1:2 )$derivCoef
all.equal( rep( 0, 10 ),
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", seSimplify = TRUE, yCat = 0:2 )$derivCoef )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
    yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors)
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
  seSimplify = FALSE, yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
  seSimplify = FALSE, yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
  seSimplify = FALSE, yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
  seSimplify = FALSE, yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
  seSimplify = FALSE, yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ], 
    seSimplify = FALSE, yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), 
  check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors, simplified)
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
    yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd)
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE, yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE, yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE, yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE, yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
  seSimplify = FALSE, yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
    xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ),
    seSimplify = FALSE, yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), 
  check.attributes = FALSE )
# semi-elasticity of age with standard errors (only standard errors, xMeanSd, simplified)
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 2 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0:1 )
urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEla( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuad, c( 3, 4 ), 
    model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
    xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0:2 )[ 
      c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
# semi-elasticity of age based on partial derivatives calculated by the mfx package
# (differs from the above, because mean(age)^2 is not the same as mean(age^2))
# estMLogitQuadMfx <- logitmfx( lfp ~ kids + age + I(age^2) + educ, data = Mroz87 )
# estMLogitQuadMfx$mfxest[ "age", 1:2 ] * xMeanQuad[ "age" ] +
#   2 * estMLogitQuadMfx$mfxest[ "I(age^2)", 1:2 ] * xMeanQuad[ "age" ]^2

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
estMLogitInt <- mlogit( lfp3 ~ 0 | kids + age30.37 + age38.44 + age53.60 + educ, 
  data = Mroz87, reflevel = "no", shape = "wide" )
summary( estMLogitInt )
# vector for permuting coefficients so that they are ordered in the same way 
# as expected by urbinEla()
coefPermuteInt <- c( seq( 1, 11, 2 ), seq( 2, 12, 2 ) )
# mean values of the explanatory variables
xMeanInt <- c( xMeanLin[1:2], mean( Mroz87$age30.37 ), 
  mean( Mroz87$age38.44 ), mean( Mroz87$age53.60 ), xMeanLin[4] )
# semi-elasticity of age without standard errors
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 2 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
    c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:2 )[
      c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )
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
Mroz87Lower$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mLower <- mlogit.data( Mroz87Lower, shape = "wide", 
  choice = "lfp3" )
Mroz87Upper <- Mroz87
Mroz87Upper$age <- Mroz87$age * 1.05
Mroz87Upper$age30.37 <- Mroz87Upper$age <= 37.5
Mroz87Upper$age38.44 <- Mroz87Upper$age > 37.5 & Mroz87Upper$age <= 44.5
Mroz87Upper$age45.52 <- Mroz87Upper$age > 44.5 & Mroz87Upper$age <= 52.5
Mroz87Upper$age53.60 <- Mroz87Upper$age > 52.5 
all.equal( 
  Mroz87Upper$age30.37 + Mroz87Upper$age38.44 + Mroz87Upper$age45.52 + 
    Mroz87Upper$age53.60, rep( 1, nrow( Mroz87 ) ) )
Mroz87Upper$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mUpper <- mlogit.data( Mroz87Upper, shape = "wide", 
  choice = "lfp3" )
10 * ( colMeans( 
  predict( estMLogitInt, newdata = Mroz87mUpper, type = "response" ) ) -
    colMeans(
      predict( estMLogitInt, newdata = Mroz87mLower, type = "response" ) ) )
Mroz87mLowerMean <- Mroz87mLower
Mroz87mUpperMean <- Mroz87mUpper
Mroz87mLowerMean$kids <- Mroz87mUpperMean$kids <- xMeanInt[ "kids" ]
Mroz87mLowerMean$educ <- Mroz87mUpperMean$educ <- xMeanInt[ "educ" ]
10 * ( colMeans( 
  predict( estMLogitInt, newdata = Mroz87mUpperMean, type = "response" ) ) -
    colMeans(
      predict( estMLogitInt, newdata = Mroz87mLowerMean, type = "response" ) ) )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0 )$derivCoef
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1 )$derivCoef
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 2 )$derivCoef
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:1 )$derivCoef
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 12 ),
  urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
    c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ], 
  allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
  xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ], 
  allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
  xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ], 
  allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
  xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ], 
  allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
  xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ], 
  allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
  xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 12 ), c(
  numericGradient( function( x, ... ){ urbinElaInt( x, ... )$semEla }, 
    t0 = coef( estMLogitInt )[ coefPermuteInt ], 
    allXVal = xMeanInt, xPos = c( 3, 4, 0, 5 ), 
    xBound = c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit", yCat = 0:2 ) ) )
# semi-elasticity of age with standard errors (full covariance matrix)
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
  yCat = 0 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
  yCat = 1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
  yCat = 2 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
  yCat = 0:1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
    c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
    allCoefVcov = vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ],
    yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), check.attributes = FALSE ) 
# semi-elasticity of age with standard errors (only standard errors)
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
  yCat = 0 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
  yCat = 1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
  yCat = 2 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
  yCat = 0:1 )
urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
  c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
  allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinElaInt( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt,
    c( 3, 4, 0, 5 ), c( 30, 37.5, 44.5, 52.5, 60 ), model = "mlogit",
    allCoefVcov = sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ],
    yCat = 0:2 )[ c( "semEla", "stdEr" ) ] ), check.attributes = FALSE )


### effect of age changing between discrete intervals 
### if age is used as linear explanatory variable 
# mean values of the 'other' explanatory variables
xMeanLinInt <- c( xMeanLin[ 1:2 ], NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
  yCat = 0 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
  yCat = 1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
  yCat = 2 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
  yCat = 0:1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
  yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
    xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit",
    yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), check.attributes = FALSE )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
Mroz87Ref <- as.data.frame( t( replace( xMeanLin, 3, 35 ) ) )
Mroz87Ref$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mRef <- mlogit.data( Mroz87Ref, shape = "wide", 
  choice = "lfp3" )
Mroz87Int <- as.data.frame( t( replace( xMeanLin, 3, 55 ) ) )
Mroz87Int$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mInt <- mlogit.data( Mroz87Int, shape = "wide", 
  choice = "lfp3" )
predict( estMLogitLin, newdata = Mroz87mInt, type = "response" ) -
  predict( estMLogitLin, newdata = Mroz87mRef, type = "response" )
# partial derivatives of the semi-elasticity wrt the coefficients
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0 )$derivCoef
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 1 )$derivCoef
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 2 )$derivCoef
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0:1 )$derivCoef
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 8 ),
  urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
    c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the semi-elasticity wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitLin )[ coefPermuteLin ],
  allXVal = xMeanLinInt, xPos = 3,
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 8 ), c(
  numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
    t0 = coef( estMLogitLin )[ coefPermuteLin ],
    allXVal = xMeanLinInt, xPos = 3,
    refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0:2 ) ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix) 
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
  yCat = 0 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
  yCat = 1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
  yCat = 2 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
  yCat = 0:1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], xMeanLinInt, 3,
    c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
    allCoefVcov = vcov( estMLogitLin )[ coefPermuteLin, coefPermuteLin ], 
    yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), check.attributes = FALSE )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors) 
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
  yCat = 0 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
  yCat = 1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
  yCat = 2 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
  yCat = 0:1 )
urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
  xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffInt( coef( estMLogitLin )[ coefPermuteLin ], allXVal = xMeanLinInt, 
    xPos = 3, refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", 
    allCoefVcov = sqrt( diag( vcov( estMLogitLin ) ) )[ coefPermuteLin ],
    yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), check.attributes = FALSE )


### effect of age changing between discrete intervals 
### if age is used as linear and quadratic explanatory variable 
# mean values of the 'other' explanatory variables
xMeanQuadInt <- c( xMeanLin[ 1:2 ], NA, NA, xMeanLin[4] )
# effects of age changing from the 30-40 interval to the 50-60 interval
# without standard errors
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", yCat = 0 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", yCat = 1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", yCat = 2 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", yCat = 0:1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
    xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
    model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), 
  check.attributes = FALSE )
# effects of age changing from the 30-40 interval to the 50-60 interval
# based on predicted values
Mroz87Ref <- as.data.frame( t( replace( xMeanQuad, 3:4, c( 35, 35^2 ) ) ) )
Mroz87Ref$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mRef <- mlogit.data( Mroz87Ref, shape = "wide", 
  choice = "lfp3" )
Mroz87Int <- as.data.frame( t( replace( xMeanQuad, 3:4, c( 55, 55^2 ) ) ) )
Mroz87Int$lfp3 <- factor( "no", levels = levels( Mroz87$lfp3 ) )
Mroz87mInt <- mlogit.data( Mroz87Int, shape = "wide", 
  choice = "lfp3" )
predict( estMLogitQuad, newdata = Mroz87mInt, type = "response" ) -
  predict( estMLogitQuad, newdata = Mroz87mRef, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0 )$derivCoef
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 1 )$derivCoef
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 2 )$derivCoef
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0:1 )$derivCoef
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 10 ),
  urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
    c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
  t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
  allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
  refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 10 ), c(
  numericGradient( function( x, ... ){ urbinEffInt( x, ... )$effect }, 
    t0 = coef( estMLogitQuad )[ coefPermuteQuad ],
    allXVal = xMeanQuadInt, xPos = c( 3, 4 ),
    refBound = c( 30, 40 ), intBound = c( 50, 60 ), model = "mlogit", yCat = 0:2 ) ) )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (full covariance matrix) 
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 0 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 2 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 0:1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
  c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, 
    c( 3, 4 ), c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
    allCoefVcov = vcov( estMLogitQuad )[ coefPermuteQuad, coefPermuteQuad ],
    yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), check.attributes = FALSE )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (only standard errors) 
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 0 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 2 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 0:1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
  xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
  model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], allXVal = xMeanQuadInt, 
    xPos = c( 3, 4 ), refBound = c( 30, 40 ), intBound = c( 50, 60 ), 
    model = "mlogit", sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
    yCat = 0:2 )[ c( "effect", "stdEr" ) ] ), check.attributes = FALSE )
# effects of age changing from the 30-40 interval to the 50-60 interval
# (standard errors + mean value and standard deviation of age)
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 2 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0:1 )
urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
  c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
  allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
  xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffInt( coef( estMLogitQuad )[ coefPermuteQuad ], xMeanQuadInt, c( 3, 4 ),
    c( 30, 40 ), c( 50, 60 ), model = "mlogit", 
    allCoefVcov = sqrt( diag( vcov( estMLogitQuad ) ) )[ coefPermuteQuad ],
    xMeanSd = c( mean( Mroz87$age ), sd( Mroz87$age ) ), yCat = 0:2 )[
      c( "effect", "stdEr" ) ] ), check.attributes = FALSE )


### grouping and re-basing categorical variables
### effects of age changing from the 30-44 category to the 53-60 category
# without standard errors
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
    xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0:2 )[
      c( "effect", "stdEr" ) ] ), check.attributes = FALSE )
# effects calculated based on predicted values
names( xMeanInt ) <- 
  gsub( "TRUE|full:", "", names( coef( estMLogitInt )[ seq( 1, 11, 2 ) ] ) )
df30.37 <- df38.44 <- df45.52 <- df53.60 <- as.data.frame( t( xMeanInt ) ) 
df30.37[ , 3:5 ] <- c( TRUE, FALSE, FALSE )
df38.44[ , 3:5 ] <- c( FALSE, TRUE, FALSE )
df45.52[ , 3:5 ] <- c( FALSE, FALSE, FALSE )
df53.60[ , 3:5 ] <- c( FALSE, FALSE, TRUE )
df30.37$lfp3 <- df38.44$lfp3 <- df45.52$lfp3 <- df53.60$lfp3 <- 
  factor( "no", levels = levels( Mroz87$lfp3 ) )
df30.37m <- mlogit.data( df30.37, shape = "wide", choice = "lfp3" )
df38.44m <- mlogit.data( df38.44, shape = "wide", choice = "lfp3" )
df45.52m <- mlogit.data( df45.52, shape = "wide", choice = "lfp3" )
df53.60m <- mlogit.data( df53.60, shape = "wide", choice = "lfp3" )
predict( estMLogitInt, newdata = df53.60m, type = "response" ) -
  sum( Mroz87$age30.37 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estMLogitInt, newdata = df30.37m, type = "response" ) -
  sum( Mroz87$age38.44 ) / sum( Mroz87$age30.37 + Mroz87$age38.44 ) *
  predict( estMLogitInt, newdata = df38.44m, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 1 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 2 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0:1 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 12 ),
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
    c( 3:5 ), c( -1, -1, 1, 0 ), model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 12 ), c(
  numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
    t0 = coef( estMLogitInt )[ coefPermuteInt ],
    allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( -1, -1, 1, 0 ),
    model = "mlogit", yCat = 0:2 ) ) )
# with full covariance matrix
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
    c( -1, -1, 1, 0 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
    model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ),
  check.attributes = FALSE )
# with standard errors only
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist( 
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
    c( -1, -1, 1, 0 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
    model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ),
  check.attributes = FALSE )
### effects of age changing from the 53-60 category to the 38-52 category
# without standard errors
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), model = "mlogit", yCat = 1:2 )
all.equal( c( 0, NA ), unlist(
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
    c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ),
  check.attributes = FALSE )
# effects calculated based on predicted values
sum( Mroz87$age38.44 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estMLogitInt, newdata = df38.44m, type = "response" ) +
  sum( Mroz87$age45.52 ) / sum( Mroz87$age38.44 + Mroz87$age45.52 ) *
  predict( estMLogitInt, newdata = df45.52m, type = "response" ) -
  predict( estMLogitInt, newdata = df53.60m, type = "response" )
# partial derivatives of the effect wrt the coefficients
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 1 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 2 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0:1 )$derivCoef
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
  c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 1:2 )$derivCoef
all.equal( rep( 0, 12 ),
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, 
    c( 3:5 ), c( 0, 1, -1, 1 ), model = "mlogit", yCat = 0:2 )$derivCoef )
# numerically computed partial derivatives of the effect wrt the coefficients
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
  model = "mlogit", yCat = 0 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
  model = "mlogit", yCat = 1 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
  model = "mlogit", yCat = 2 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
  model = "mlogit", yCat = 0:1 )
numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
  t0 = coef( estMLogitInt )[ coefPermuteInt ],
  allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 12 ), c(
  numericGradient( function( x, ... ){ urbinEffCat( x, ... )$effect }, 
    t0 = coef( estMLogitInt )[ coefPermuteInt ],
    allXVal = xMeanInt, xPos = c( 3:5 ), xGroups = c( 0, 1, -1, 1 ), 
    model = "mlogit", yCat = 0:2 ) ) )
# with full covariance matrix
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
    c( 0, 1, -1, 1 ), vcov( estMLogitInt )[ coefPermuteInt, coefPermuteInt ], 
    model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ),
  check.attributes = FALSE )
# with standard errors only
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 0 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 2 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 0:1 )
urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
  c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
  model = "mlogit", yCat = 1:2 )
all.equal( rep( 0, 2 ), unlist(
  urbinEffCat( coef( estMLogitInt )[ coefPermuteInt ], xMeanInt, c( 3:5 ), 
    c( 0, 1, -1, 1 ), sqrt( diag( vcov( estMLogitInt ) ) )[ coefPermuteInt ], 
    model = "mlogit", yCat = 0:2 )[ c( "effect", "stdEr" ) ] ),
  check.attributes = FALSE )

