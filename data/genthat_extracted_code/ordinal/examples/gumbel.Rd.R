library(ordinal)


### Name: gumbel
### Title: The Gumbel Distribution
### Aliases: dgumbel pgumbel qgumbel rgumbel ggumbel
### Keywords: distribution

### ** Examples


## Illustrating the symmetry of the distribution functions:
pgumbel(5) == 1 - pgumbel(-5, max=FALSE) ## TRUE
dgumbel(5) == dgumbel(-5, max=FALSE) ## TRUE
ggumbel(5) == -ggumbel(-5, max=FALSE) ## TRUE

## More examples:
x <- -5:5

(pp <- pgumbel(x))
qgumbel(pp)
dgumbel(x)
ggumbel(x)

(ppp <- pgumbel(x, max=FALSE))
## Observe that probabilities close to 0 are more accurately determined than 
## probabilities close to 1:
qgumbel(ppp, max=FALSE)
dgumbel(x, max=FALSE)
ggumbel(x, max=FALSE)

## random deviates:
set.seed(1)
(r1 <- rgumbel(10))
set.seed(1)
r2 <- -rgumbel(10, max = FALSE)
all(r1 == r2) ## TRUE




