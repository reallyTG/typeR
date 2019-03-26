library(corpcor)


### Name: pseudoinverse
### Title: Pseudoinverse of a Matrix
### Aliases: pseudoinverse
### Keywords: algebra

### ** Examples

# load corpcor library
library("corpcor")

# a singular matrix
m = rbind(
c(1,2),
c(1,2)
)

# not possible to invert exactly
try(solve(m))

# pseudoinverse
p = pseudoinverse(m)
p

# characteristics of the pseudoinverse
zapsmall( m %*% p %*% m )  ==  zapsmall( m )
zapsmall( p %*% m %*% p )  ==  zapsmall( p )
zapsmall( p %*% m )  ==  zapsmall( t(p %*% m ) )
zapsmall( m %*% p )  ==  zapsmall( t(m %*% p ) )


# example with an invertable matrix
m2 = rbind(
c(1,1),
c(1,0)
)
zapsmall( solve(m2) ) == zapsmall( pseudoinverse(m2) )



