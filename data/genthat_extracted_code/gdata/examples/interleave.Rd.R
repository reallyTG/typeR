library(gdata)


### Name: interleave
### Title: Interleave Rows of Data Frames or Matrices
### Aliases: interleave
### Keywords: category array

### ** Examples


# Simple example
a <- matrix(1:10,ncol=2,byrow=TRUE)
b <- matrix(letters[1:10],ncol=2,byrow=TRUE)
c <- matrix(LETTERS[1:10],ncol=2,byrow=TRUE)
interleave(a,b,c)

# Useful example:
#
# Create a 2-way table of means, standard errors, and # obs

g1 <- sample(letters[1:5], 1000, replace=TRUE)
g2 <- sample(LETTERS[1:3], 1000, replace=TRUE )
dat <- rnorm(1000)

stderr <- function(x) sqrt( var(x,na.rm=TRUE) / nobs(x) )

means   <- tapply(dat, list(g1, g2), mean )
stderrs <- tapply(dat, list(g1, g2), stderr )
ns      <- tapply(dat, list(g1, g2), nobs )
blanks <- matrix( " ", nrow=5, ncol=3)

tab <- interleave( "Mean"=round(means,2),
                   "Std Err"=round(stderrs,2),
                   "N"=ns, " " = blanks, sep=" " )

print(tab, quote=FALSE)

# Using drop to control coercion to a lower dimensions:

m1 <- matrix(1:4)
m2 <- matrix(5:8)

interleave(m1, m2, drop=TRUE)  # This will be coerced to a vector

interleave(m1, m2, drop=FALSE) # This will remain a matrix





