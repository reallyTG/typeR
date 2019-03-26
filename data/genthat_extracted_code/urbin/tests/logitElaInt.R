library( "urbin" )

# Example
ela8a <- urbinElaInt( allCoef = c( 0.33, 0.22, 0.05, 0.6 ), 
  allXVal = c( 1, 0.4, 0.12, 0.13 ), 
  xPos = c( 2, 0, 3, 4 ),
  xBound = c( 0, 500, 1000, 1500, Inf ),
  model = "logit" )
ela8a 

ela8b <- urbinElaInt( allCoef = c( 0.33, 0.22, 0.05, 0.6 ), 
  allXVal = c( 1, 0.4, 0.12, 0.13 ), 
  xPos = c( 2, 0, 3, 4 ),
  xBound = c( 0, 500, 1000, 1500, Inf ),
  allCoefVcov = c( 0.003, 0.045, 0.007, 0.009 ),
  model = "logit" )
ela8b 

# Example
ela9a <- urbinElaInt( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 0.4, 0.12 ), 
  xPos = c( 2, 0, 3 ), 
  xBound = c( 0, 500, 1000, Inf ), yCat = 2, 
  model = "mlogit" )
ela9a

ela9b <- urbinElaInt( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 0.4, 0.12 ), 
  xPos = c( 2, 0, 3 ), 
  xBound = c( 0, 500, 1000, Inf ), yCat = 2, 
  allCoefVcov = c( 0.003, 0.045, 0.007, 0.009, 0.0008, 0.9 ),
  model = "mlogit" )
ela9b
