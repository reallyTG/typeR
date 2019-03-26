library(ordering)


### Name: ordering
### Title: ordering
### Aliases: ordering monotonicity

### ** Examples

  ordering( 1:3 )      # 2  
  ordering( c(1,1,3) ) # 1 
  ordering( c(1,0,1) ) # 0  "No ordering, does not apply constant"
  ordering( c(3,1,1) ) # -1
  ordering( 3:1 )      # -2
  



