library(trend)


### Name: bartels.test
### Title: Bartels Test for Randomness
### Aliases: bartels.test
### Keywords: htest nonparametric ts univar

### ** Examples

# Example from Schoenwiese (1992, p. 113)
## Number of frost days in April at Munich from 1957 to 1968
## 
frost <- ts(data=c(9,12,4,3,0,4,2,1,4,2,9,7), start=1957)
bartels.test(frost)

## Example from Sachs (1997, p. 486)
x <- c(5,6,2,3,5,6,4,3,7,8,9,7,5,3,4,7,3,5,6,7,8,9)
bartels.test(x)

## Example from Bartels (1982, p. 43)
x <- c(4, 7, 16, 14, 12, 3, 9, 13, 15, 10, 6, 5, 8, 2, 1, 11, 18, 17)
bartels.test(x)
 



