library(na.tools)


### Name: all_na
### Title: Tests for missing values
### Aliases: all_na all_na.default any_na is_na which_na

### ** Examples


  all_na( c( NA, NA, 1 ) )    # FALSE
  all_na( c( NA, NA, NA ) )   # TRUE
  
  df <- data.frame( char = rep(NA_character_, 3), nums=1:3)
  all_na(df)  # FALSE
  
  df <- data.frame( char = rep(NA_character_, 3), nums=rep(NA_real_,3))
  all_na(df)  # TRUE
  
  any_na( 1:10 )           # FALSE
  any_na( c( 1, NA, 3 ) )  # TRUE


  x <- c( 1, NA, NA, 4:6 )
  which_na(x)
  
  names(x) <- letters[1:6]
  which_na(x)
 



