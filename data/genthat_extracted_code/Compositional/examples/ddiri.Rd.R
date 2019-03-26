library(Compositional)


### Name: Density values of a Dirichlet distribution
### Title: Density values of a Dirichlet distribution
### Aliases: ddiri
### Keywords: Dirichlet distribution density values

### ** Examples

x <- rdiri( 100, c(5, 7, 4, 8, 10, 6, 4) )
a <- diri.est(x)
f <- ddiri(x, a$param)
sum(f)
a



