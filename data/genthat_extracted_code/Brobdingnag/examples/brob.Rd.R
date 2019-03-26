library(Brobdingnag)


### Name: brob
### Title: Brobdingnagian numbers
### Aliases: brob as.brob is.brob
### Keywords: math

### ** Examples


googol <- as.brob(10)^100
googolplex <- 10^googol

(googolplex/googol) / googolplex
#  Thus googolplex/googol == googolplex (!)


# use cbrob() instead of c() when Brobdingnagian numbers are involved:
cbrob(4,exp(as.brob(1e55)))





