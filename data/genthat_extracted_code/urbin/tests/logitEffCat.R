library( "urbin" )

# Example
eff10a <- urbinEffCat( allCoef = c( 0.28, 0.003, 0.175, -0.034, 
  -0.05, 0.89, -1.2 ), 
  allXVal = c( 1, 0.1, 0.3, 0.15, 0.2, 0.34, 0.8 ), model = "logit", 
  xPos = c( 2:5 ), xGroups = c( 0, -1, 1, 1, -1 ) )
eff10a

eff10b <- urbinEffCat( allCoef = c( 0.28, 0.003, 0.175, -0.034, 
  -0.05, 0.89, -1.2 ), 
  allXVal = c( 1, 0.1, 0.3, 0.15, 0.2, 0.34, 0.8 ), 
  xPos = c( 2:5 ), xGroups = c( 0, -1, 1, 1, -1 ), model = "logit",
  allCoefVcov = c( 0.03, 0.001, 0.05, 0.01, 
    0.04, 0.05, 0.8 ) )
eff10b

# Example
eff11a <- urbinEffCat( allCoef = c( 0.28, 0.003, 0.0075, -0.034, 
  -0.005, 0.89, 0.005, 0.06, 1.7 ),
  allXVal = c( 1, 0.5, 0.3 ), xPos = c( 2:3 ), 
  xGroups = c( -1, -1, 1 ), yCat = 2, model = "mlogit" )
eff11a

eff11b <- urbinEffCat( allCoef = c( 0.28, 0.003, 0.0075, -0.034, 
  -0.005, 0.89, 0.005, 0.06, 1.7 ),
  allXVal = c( 1, 0.5, 0.3 ), xPos = c( 2:3 ), 
  xGroups = c( -1, -1, 1 ), yCat = 2, model = "mlogit", 
  allCoefVcov = c( 0.03, 0.0001, 0.005, 0.01, 0.004, 
    0.05, 0.004, 0.5, 0.0078 ) )
eff11b
