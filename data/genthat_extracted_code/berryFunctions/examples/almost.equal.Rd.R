library(berryFunctions)


### Name: almost.equal
### Title: Vectorized testing for near-equality
### Aliases: almost.equal

### ** Examples


# General usage:
x <- c(0.4-0.1, 0.5-0.2)
x
x==0.3                    # FALSE TRUE # but mathematically, x is 0.3
all.equal(x, rep(0.3,2))  # TRUE
almost.equal(x,0.3)       # TRUE TRUE  # nice

y <- c(7777, 0.3)
   all.equal(x,y) # "Mean relative difference: 25922.33"   Not what I want
almost.equal(x,y) # FALSE TRUE                             Exactly what I want


# Testing vectorization
almost.equal(1:6, 3)
almost.equal(1:6, NA)
almost.equal(1:6, NULL)


# Testing the function for different data types (in order of coercion):
almost.equal(c(TRUE,FALSE,NA), c(TRUE,FALSE,NA))      # logical
almost.equal(as.factor(letters), as.factor(letters))  # factor
   all.equal(1:6, 1:6)
almost.equal(1:6, 1:6)                                # integer  numeric see above
0.4+0.4i - 0.1-0.1i == 0.3+0.3i
almost.equal(0.4+0.4i - 0.1-0.1i, 0.3+0.3i)           # complex
   all.equal(letters, tolower(LETTERS))
almost.equal(letters, tolower(LETTERS))               # character
almost.equal(Sys.Date()+1:4,Sys.Date()+1:4)           # Date
x <- Sys.time()+0:2
all.equal(x,x)
almost.equal(x,x)                                     # POSIXt
A <- list(a=1:5, b=0.5-0.2)
B <- list(a=1:5, b=0.4-0.1)
   all.equal(A,B)
almost.equal(A,B)                                     # list





