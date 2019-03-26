library(social)


### Name: social.signal
### Title: Social signal
### Aliases: social.signal

### ** Examples

A = matrix(c(0,1,0,1,0,
             1,0,0,1,1,
             0,0,0,1,1,
             1,1,1,0,0,
             0,1,1,0,0), nrow=5)
S = social.cor.matrix(A)
x = rnorm(nrow(A))
s = social.signal(x, S)




