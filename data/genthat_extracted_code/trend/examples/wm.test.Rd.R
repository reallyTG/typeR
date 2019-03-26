library(trend)


### Name: wm.test
### Title: Wallis and Moore Phase-Frequency Test
### Aliases: wm.test
### Keywords: htest nonparametric

### ** Examples

## Example from Schoenwiese (1992, p. 113)
## Number of frost days in April at Munich from 1957 to 1968
## z = -0.124, Accept H0
frost <- ts(data=c(9,12,4,3,0,4,2,1,4,2,9,7), start=1957)
wm.test(frost)

## Example from Sachs (1997, p. 486)
## z = 2.56, Reject H0 on a level of p < 0.05
x <- c(5,6,2,3,5,6,4,3,7,8,9,7,5,3,4,7,3,5,6,7,8,9)
wm.test(x)

wm.test(nottem)




