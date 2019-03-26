library(refset)


### Name: wrap
### Title: Wrap an expression and its environment into a parcel.
### Aliases: wrap

### ** Examples

dfr <- data.frame(a=1:4, b=1:4)
rs %r% dfr[1:2,]
parcel <- wrap(rs)
f <- function (parcel) contents(parcel) <- contents(parcel)*2
f(parcel)
contents(parcel)
dfr

parcel <- wrap(x^2) # non-refset use
x <- 3           
f <- function(parcel) {x <- 10; contents(parcel)}
f(parcel)




