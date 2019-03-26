library(ordering)


### Name: is_constant
### Title: ordering Tests
### Aliases: is_constant is_increasing is_strictly_increasing is_decreasing
###   is_strictly_decreasing is_incremental is_uniform is_monotonic
###   is_strictly_monotonic is_sorted is_strictly_sorted is_unsorted
###   is_strictly_unsorted

### ** Examples

  
  is_constant( rep(3,5) )

  is_increasing( 1:5 )                   # TRUE
  is_increasing( c(1,2,1,3) )            # FALSE
  
  is_increasing( c(1,NA,2,3) )           # NA 
  is_increasing( c(1,NA,2,3), na.omit )  # TRUE

  is_monotonic( 1:5 )                    # TRUE
  is_monotonic( -5:5 )                   # TRUE
  is_monotonic( 5:-5 )                   # TRUE
  is_monotonic( c(1,5,3))                # FALSE
  

  is_incremental(1:5 )
  is_incremental( c(1,2,5))
  
  is_incremental(1:5, step=NULL)
  is_uniform(1:5)


  is_monotonic( 1:3 )
  is_strictly_monotonic(1:3)
  
  is_monotonic( c(1,3,2) )
  is_strictly_monotonic( c(1,3,2) )
  
  is_sorted(1:3)
  is_sorted(c(1,3,2))   
  
  lets <- letters[1:3]
  is_monotonic( lets )
  is_monotonic( c('a', 'c', 'b') )
  
  is_sorted(1:10)
  
  is_sorted(-5:5)
  is_sorted(5:-5)
  
  is_sorted( letters )
  is_sorted( rev(letters) )
  



