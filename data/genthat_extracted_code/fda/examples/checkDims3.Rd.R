library(fda)


### Name: checkDims3
### Title: Compare dimensions and dimnames of arrays
### Aliases: checkDim3 checkDims3
### Keywords: utilities

### ** Examples

# Select the first two rows of y
stopifnot(all.equal(
checkDim3(1:2, 3:5),
list(x=array(1:2, c(2,1,1), list(c('x1','x2'), NULL, NULL)),
     y=array(3:4, c(2,1,1), list(c('x1','x2'), NULL, NULL)) )
))

# Select the first two rows of a matrix y
stopifnot(all.equal(
checkDim3(1:2, matrix(3:8, 3)),
list(x=array(1:2,         c(2,1,1), list(c('x1','x2'), NULL, NULL)),
     y=array(c(3:4, 6:7), c(2,2,1), list(c('x1','x2'), NULL, NULL)) )
))

# Select the first column of y
stopifnot(all.equal(
checkDim3(1:2, matrix(3:8, 3), 2, 2),
list(x=array(1:2,         c(2,1,1), list(NULL, 'x', NULL)),
     y=array(3:5, c(3,1,1), list(NULL, 'x', NULL)) )
))

# Select the first two rows and the first column of y
stopifnot(all.equal(
checkDims3(1:2, matrix(3:8, 3), 1:2, 1:2),
list(x=array(1:2, c(2,1,1), list(c('x1','x2'), 'x', NULL)),
     y=array(3:4, c(2,1,1), list(c('x1','x2'), 'x', NULL)) )
))

# Select the first 2 rows of y
x1 <- matrix(1:4, 2, dimnames=list(NULL, LETTERS[2:3]))
x1a <- x1. <- as.array3(x1)
dimnames(x1a)[[1]] <- c('x1', 'x2')
y1 <- matrix(11:19, 3, dimnames=list(NULL, LETTERS[1:3]))
y1a <- y1. <- as.array3(y1)
dimnames(y1a)[[1]] <- c('x1', 'x2', 'x3')

stopifnot(all.equal(
checkDim3(x1, y1),
list(x=x1a, y=y1a[1:2, , , drop=FALSE])
))

# Select columns 2 & 3 of y
stopifnot(all.equal(
checkDim3(x1, y1, 2, 2),
list(x=x1., y=y1.[, 2:3, , drop=FALSE ])
))

# Select the first 2 rows and  columns 2 & 3 of y
stopifnot(all.equal(
checkDims3(x1, y1, 1:2, 1:2),
list(x=x1a, y=y1a[1:2, 2:3, , drop=FALSE ])
))

# y = columns 2 and 3 of x
x23 <- matrix(1:6, 2, dimnames=list(letters[2:3], letters[1:3]))
x23. <- as.array3(x23)
stopifnot(all.equal(
checkDim3(x23, xdim=1, ydim=2),
list(x=x23., y=x23.[, 2:3,, drop=FALSE ])
))

# Transfer dimnames from y to x
x4a <- x4 <- matrix(1:4, 2)
y4 <- matrix(5:8, 2, dimnames=list(letters[1:2], letters[3:4]))
dimnames(x4a) <- dimnames(t(y4))
stopifnot(all.equal(
checkDims3(x4, y4, 1:2, 2:1),
list(x=as.array3(x4a), y=as.array3(y4))
))

# as used in plotfit.fd
daybasis65 <- create.fourier.basis(c(0, 365), 65)

daytempfd <- with(CanadianWeather, smooth.basis(
       day.5, dailyAv[,,"Temperature.C"], 
       daybasis65, fdnames=list("Day", "Station", "Deg C"))$fd )

defaultNms <- with(daytempfd, c(fdnames[2], fdnames[3], x='x'))
subset <- checkDims3(CanadianWeather$dailyAv[, , "Temperature.C"],
               daytempfd$coef, defaultNames=defaultNms)
# Problem:  dimnames(...)[[3]] = '1'
# Fix:
subset3 <- checkDims3(
        CanadianWeather$dailyAv[, , "Temperature.C", drop=FALSE],
               daytempfd$coef, defaultNames=defaultNms)



