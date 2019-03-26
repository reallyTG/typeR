library( "urbin" )

# Example
eff6a <- urbinEffInt( allCoef = c( 0.33, 0.22, 0.05, 0.6 ),
  allXVal = c( 1, NA, 0.16, 0.13 ),
  xPos = 2, 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ), model = "logit" )
eff6a

eff6b <- urbinEffInt( allCoef = c( 0.33, 0.22, 0.05, 0.6 ),
  allXVal = c( 1, NA, 0.16, 0.13 ),
  xPos = 2, 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ), 
  allCoefVcov = c( 0.003, 0.045, 0.007, 0.009 ), model = "logit" )
eff6b

# Example
eff7a <- urbinEffInt( allCoef = c( 0.33, 0.022, 0.005, 0.6 ),
  allXVal = c( 1, NA, NA, 0.0004 ),
  xPos = c( 2, 3 ), 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ), model = "logit" )
eff7a

eff7b <- urbinEffInt( allCoef = c( 0.33, 0.022, 0.005, 0.6 ),
  allXVal = c( 1, NA, NA, 0.13 ),
  xPos = c( 2, 3 ), 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ), 
  allCoefVcov = c( 0.003, 0.011, 0.0025, 0.009 ), model = "logit" )
eff7b

#Example
eff8a <- urbinEffInt( allCoef = c( -2.5, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, NA, 0.12 ), 
  xPos = 2, 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ),
  yCat = 2, model = "mlogit" )
eff8a

eff8b <- urbinEffInt( allCoef = c( -2.5, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, NA, 0.12 ), 
  xPos = 2, 
  refBound = c( 8, 12 ), intBound = c( 13, 15 ),
  yCat = 2, 
  allCoefVcov = c( 0.003, 0.045, 0.007, 0.009, 0.0008, 0.9 ),
  model = "mlogit" )
eff8b

#Example
eff9a <- urbinEffInt( allCoef = c( 0.2, 0.03, 0.005, -0.2, 0.03, 0.006 ), 
  allXVal = c( 1, NA, NA ), 
  xPos = c( 2, 3 ), 
  refBound = c( 1, 12 ), intBound = c( 13, 25 ),
  yCat = 2, model = "mlogit" )
eff9a

eff9b <- urbinEffInt( allCoef = c( 0.2, 0.03, 0.005, -0.2, 0.03, 0.006 ), 
  allXVal = c( 1, NA, NA ), 
  xPos = c( 2, 3 ), 
  refBound = c( 1, 12 ), intBound = c( 13, 25 ),
  yCat = 2, 
  allCoefVcov = c( 0.03, 0.025, 0.0007, 0.009, 0.008, 0.0009 ),
  model = "mlogit" )
eff9b
