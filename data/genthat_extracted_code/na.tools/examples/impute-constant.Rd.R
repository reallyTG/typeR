library(na.tools)


### Name: impute-constant
### Title: Impute by Constant Value Replaces 'NA's by a constant
### Aliases: impute-constant na.constant na.inf na.neginf na.true na.false
###   na.zero

### ** Examples

  na.constant( c(1,NA,2), -1 )
 
  na.inf( c( 1, 2, NA, 4) )
  na.neginf( c( 1, 2, NA, 4) ) 
  
  na.true( c(TRUE, NA_logical, FALSE) )   # T T F
  na.false( c(TRUE, NA_logical, FALSE) )  # T F F

 
           
  na.zero( c(1,NA,3) )  # 1 0 3 

 
           



