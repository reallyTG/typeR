library(micEconAids)


### Name: USMeatConsump
### Title: U.S. Meat Consumption Data
### Aliases: USMeatConsump
### Keywords: datasets

### ** Examples

   ## replicating the LA-AIDS estimation of the SAS example
   # loading data set
   data( USMeatConsump )

   # adding shifter variables for modeling seasonal effects
   USMeatConsump$co1 <- cos( 1 / 2 * 3.14159 * USMeatConsump$t )
   USMeatConsump$si1 <- sin( 1 / 2 * 3.14159 * USMeatConsump$t )

   # Scaling prices by their means
   USMeatConsump$beef_pm <- USMeatConsump$beef_p / mean( USMeatConsump$beef_p )
   USMeatConsump$pork_pm <- USMeatConsump$pork_p / mean( USMeatConsump$pork_p )
   USMeatConsump$chick_pm <- USMeatConsump$chick_p / mean( USMeatConsump$chick_p )
   USMeatConsump$turkey_pm <- USMeatConsump$turkey_p / mean( USMeatConsump$turkey_p )

   # Estimation of the model
   meatModel <- aidsEst( c( "beef_pm", "pork_pm", "chick_pm", "turkey_pm" ),
      c( "beef_w", "pork_w", "chick_w", "turkey_w" ),
      "meat_exp", shifterNames = c( "co1", "si1", "t" ),
      priceIndex ="S", data = USMeatConsump, maxiter=1000 )
   summary( meatModel )



