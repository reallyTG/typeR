library(operators)


### Name: but
### Title: Modification of function arguments
### Aliases: %but%
### Keywords: utilities

### ** Examples
        
### default method, nothing is done
rnorm %but% 44

### character method, operating on logical arguments
grep %but% "pf"     # grep, with perl and fixed set to TRUE
grep %but% "i-e"    # grep, ignoring the case but not using extended regular expressions
( grep %but% "vp" )( "blue", colors() )

### list method 
rnorm %but% list( mean = 3 )
rnorm %but% list( nonsense = 4 )



