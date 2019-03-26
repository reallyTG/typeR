library(optional)


### Name: fallthrough
### Title: Fallthrough function
### Aliases: fallthrough

### ** Examples

library(magrittr)

a <- 4
match_with(a,
  . %>% if (. %% 2 == 0)., 
  fallthrough( function() "This number is even" ),
  . %>% if ( sqrt(.) == round(sqrt(.)) ).,  
  function() "This number is a perfect square"
)
## [1] "This number is even"   "This number is a perfect square"



