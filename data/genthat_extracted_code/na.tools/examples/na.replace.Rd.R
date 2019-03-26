library(na.tools)


### Name: na.replace
### Title: Replace Missing Values
### Aliases: na.replace na.explicit

### ** Examples


  # Integers and numerics
  na.replace( c(1,NA,3,NA), 2 )    # 1 2 3 2   
  na.replace( c(1,NA,3,NA), 1:4 )  # 1 2 3 4

  # This produces an error because it would change the type
  ## Not run: 
##D   na.replace( c(1,NA,3,NA), letters[1:4] )  # "1" "b" "3" "d"
##D   
## End(Not run)
  
  # Characters 
  lets <- letters[1:5]
  lets[ c(2,4) ] <- NA
  na.replace(lets)  # replace with NA_explicit_

  # Factors 
  fct <- as.factor( c( NA, letters[2:4], NA) )
  fct
  na.replace(fct, "z")  # z b c d z  -- level z added
  na.replace(fct, letters[1:5] )
  na.replace(fct)
     
 ## Not run: 
##D    na.replace( rep(NA,3), rep(NA,3) )
##D  
## End(Not run)
     



