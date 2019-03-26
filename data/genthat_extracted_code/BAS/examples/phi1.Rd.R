library(BAS)


### Name: phi1
### Title: Compound Confluent hypergeometric function of two variables
### Aliases: phi1
### Keywords: math

### ** Examples


# special cases
# phi1(a, b, c, x=0, y) is the same as 2F1(b, a; c, y)
phi1(1, 2, 1.5, 0, 1 / 100)
hypergeometric2F1(2, 1, 1.5, 1 / 100, log = FALSE)

# phi1(a,0,c,x,y) is the same as 1F1(a,c,x)
phi1(1, 0, 1.5, 3, 1 / 100)
hypergeometric1F1(1, 1.5, 3, log = FALSE)



