library(trend)


### Name: cs.test
### Title: Cox and Stuart Trend Test
### Aliases: cs.test
### Keywords: htest nonparametric

### ** Examples

## Example from Schoenwiese (1992, p. 114)
## Number of frost days in April at Munich from 1957 to 1968
## z = -0.5, Accept H0
frost <- ts(data=c(9,12,4,3,0,4,2,1,4,2,9,7), start=1957)
cs.test(frost)

## Example from Sachs (1997, p. 486-487)
## z ~ 2.1, Reject H0 on a level of p = 0.0357
x <- c(5,6,2,3,5,6,4,3,7,8,9,7,5,3,4,7,3,5,6,7,8,9)
cs.test(x)

cs.test(Nile)




