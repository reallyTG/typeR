library(Ecfun)


### Name: trimImage
### Title: Trim zero rows or columns from an object of class 'Image'.
### Aliases: trimImage
### Keywords: manip

### ** Examples

##
## 1.  trim a simple matrix
##
tst1 <- matrix(.Machine$double.eps, 3, 3,
          dimnames=list(letters[1:3], LETTERS[1:3]))
tst1[2,2] <- 1
tst1t <- trimImage(tst1)

# check
tst1. <- matrix(1, 1, 1,
          dimnames=list(letters[2], LETTERS[2]))
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst1t, tst1.)
## Don't show: 
)
## End(Don't show)

##
## 2.  returnIndices2Keep
##
tst2i <- trimImage(tst1, returnIndices2Keep=TRUE)
tst2a <- trimImage(tst1, returnIndices2Keep=tst2i)

tst2i. <- list(index1=2, index2=2)


# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2i, tst2i.)
## Don't show: 
)
## End(Don't show)
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst2a, tst1.)
## Don't show: 
)
## End(Don't show)

##
## 3.  trim 0's only
##
tst3 <- array(0, dim=3:5)
tst3[2, 2:3, ] <- 0.5*.Machine$double.eps
tst3[3,,] <- 1

tst3t <- trimImage(tst3, 0)

# check
tst3t. <- tst3[2:3,, ]

# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst3t, tst3t.)
## Don't show: 
)
## End(Don't show)

##
## 4.  trim NAs
##
tst4 <- tst1
tst4[1,1] <- NA
tst4[3,] <- NA

tst4t <- trimImage(tst4)
# tst4o == tst4
tst4o <- trimImage(tst4, na.rm=FALSE)

# check
## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst4t, tst1[2, 2, drop=FALSE])
## Don't show: 
)
## End(Don't show)

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst4o, tst4)
## Don't show: 
)
## End(Don't show)

##
## 5.  trim all
##
tst4a <- trimImage(tst1, 1)

tst4a. <- matrix(0,0,0,
     dimnames=list(NULL, NULL))

## Don't show: 
stopifnot(
## End(Don't show)
all.equal(tst4a, tst4a.)
## Don't show: 
)
## End(Don't show)





