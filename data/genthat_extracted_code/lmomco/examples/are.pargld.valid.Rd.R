library(lmomco)


### Name: are.pargld.valid
### Title: Are the Distribution Parameters Consistent with the Generalized
###   Lambda Distribution
### Aliases: are.pargld.valid
### Keywords: utility (distribution) Distribution: Generalized Lambda
###   utility (distribution, parameter validation)

### ** Examples

## Not run: 
##D para <- vec2par(c(123,34,4,3),type='gld')
##D if(are.pargld.valid(para)) Q <- quagld(0.5,para)
##D 
##D # The following is an example of inconsistent L-moments for fitting but
##D # prior to lmomco version 2.1.2 and untrapped error was occurring.
##D lmr <- lmoms(c(33, 37, 41, 54, 78, 91, 100, 120, 124))
##D para <- pargld(lmr); are.pargld.valid(para)
## End(Not run)



