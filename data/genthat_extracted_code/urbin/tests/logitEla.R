library( "urbin" )

ela6a <- urbinEla( allCoef = c( 0.445, 0.03, 0.00002, 0.067, 0.89, 0.124 ),
  allXVal = c( 1, 3.3, 4.5, 2.34, 0.1, 0.987 ), xPos = 2, model = "logit" )
ela6a

ela6b <- urbinEla( allCoef = c( 0.445, 0.03, 0.00002, 0.067, 0.89, 0.124 ),
  allXVal = c( 1, 3.3, 4.5, 2.24, 0.1, 0.987 ), 
  allCoefVcov = c( 0.001, 0.02, 0.000002, 0.05, 1.2, 0.03 ), 
  xPos = 2, model = "logit" )
ela6b  

# Example 
ela7a <- urbinEla( allCoef = c( 0.445, 0.03, 0.00002, 0.067, 0.89, 0.124 ),
  allXVal = c( 1, 3.3, 3.3^2, 2.34, 0.1, 0.987 ), 
  xPos = c( 2, 3 ), model = "logit" )
ela7a

ela7b <- urbinEla( allCoef = c( 0.445, 0.03, 0.00002, 0.067, 0.89, 0.124 ),
  allXVal = c( 1, 3.3, 3.3^2, 2.34, 0.1, 0.987 ), 
  allCoefVcov = c( 0.001, 0.02, 0.000002, 0.05, 1.2, 0.03 ),
  xPos = c( 2, 3 ), model = "logit" )
ela7b

# Example
ela8a <- urbinEla( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 8.4, 0.06 ), xPos = 3,
  model = "mlogit", yCat = 2 )
ela8a

ela8b <- urbinEla( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 8.4, 0.06 ), 
  allCoefVcov = c( 0.002, 0.003, 0.004, 0.006, 0.00001, 0.08 ), 
  xPos = 3, 
  model = "mlogit", yCat = 2 )
ela8b

# Example
ela9a <- urbinEla( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 0.04, 0.0016 ), xPos = c( 2, 3 ),
  model = "mlogit", yCat = 2 )
ela9a

ela9b <- urbinEla( allCoef = c( 0.2, 0.3, 0.5, -0.2, 0.03, 0.6 ), 
  allXVal = c( 1, 0.04, 0.0016 ), 
  allCoefVcov = c( 0.002, 0.003, 0.004, 0.006, 0.00001, 0.08 ), 
  xPos = c( 2, 3 ), 
  model = "mlogit", yCat = 2 )
ela9b
