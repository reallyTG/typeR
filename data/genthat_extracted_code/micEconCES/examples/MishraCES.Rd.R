library(micEconCES)


### Name: MishraCES
### Title: Mishra's (2006) CES data
### Aliases: MishraCES
### Keywords: datasets

### ** Examples

   # load the data set
   data( "MishraCES" )
   
   # show mean values of all variables
   colMeans( MishraCES )

   # re-calculate the endogenous variable (see Mishra 2006)
   # coefficients of the nested CES function with 4 inputs
   b <- c( "gamma" = 200 * 0.5^(1/0.6), "delta_1" = 0.6, "delta_2" = 0.3, 
      "delta" = 0.5, "rho_1" = 0.5, "rho_2" = -0.17, "rho" = 0.6 )
   MishraCES$Y2 <- cesCalc( xNames = c( "X1", "X2", "X3", "X4" ), 
      data = MishraCES, coef = b, nested = TRUE )
   all.equal( MishraCES$Y, MishraCES$Y2 )



