library(Skillings.Mack)


### Name: Ski.Mack
### Title: The Skillings-Mack test statistic
### Aliases: Ski.Mack
### Keywords: block designs, missing values

### ** Examples

## Skillings and Mack (1981), Table 1 page 173
## Comparison of four methods of assembling a product
B <- rep(c(1,2,3,4,5,6,7,8,9),rep(4,9))
G <- rep(c('A','B','C','D'),9)
y <- c(3.2,4.1,3.8,4.2,    3.1,3.9,3.4,4.0,	 4.3,3.5,4.6,4.8, 
       3.5,3.6,3.9,4.0,   3.6,4.2,3.7,3.9,   4.5,4.7,3.7, NA,
	     NA ,4.2,3.4,NA ,   4.3,4.6,4.4,4.9,   3.5, NA,3.7, 3.9)
Ski.Mack(y,groups = G,blocks = B)

## y is a matrix
maty <- matrix(
   c(3.2,4.1,3.8,4.2,		3.1,3.9,3.4,4.0,	 4.3,3.5,4.6,4.8, 
     3.5,3.6,3.9,4.0,   3.6,4.2,3.7,3.9,   4.5,4.7,3.7, NA,
	   NA ,4.2,3.4,NA ,   4.3,4.6,4.4,4.9,   3.5, NA,3.7, 3.9),
    ncol=9,byrow=FALSE)
Ski.Mack(maty, simulate.p.value = TRUE, B = 1000)



