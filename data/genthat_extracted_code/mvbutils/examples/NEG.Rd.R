library(mvbutils)


### Name: NEG
### Title: Generate a negated version of your function. Useful for 'nlminb'
###   etc.
### Aliases: NEG
### Keywords: misc

### ** Examples

NEG( sqrt)( 4) # -2
# should put in more complex one here...
e <- new.env()
e$const <- 3
funco <- function( x) -sum( ( x-const)^2L)
environment( funco) <- e
nlminb( c( 0, 0), NEG( funco)) # c( 3, 3)
dfunco <- NULL
nlminb( c( 0, 0), NEG( funco), gradient=NEG( dfunco)) # c( 3, 3)



