library(zoo)


### Name: zoo
### Title: Z's Ordered Observations
### Aliases: zoo with.zoo range.zoo print.zoo as.zoo.factor summary.zoo
###   str.zoo is.zoo [.zoo [<-.zoo $.zoo $<-.zoo subset.zoo head.zoo
###   tail.zoo Ops.zoo t.zoo cumsum.zoo cumprod.zoo cummin.zoo cummax.zoo
###   mean.zoo median.zoo na.contiguous na.contiguous.data.frame
###   na.contiguous.list na.contiguous.default na.contiguous.zoo scale.zoo
###   xtfrm.zoo names.zoo names<-.zoo quantile.zoo rev.zoo transform.zoo
###   ifelse.zoo dim<-.zoo index2char index2char.default index2char.numeric
###   head.ts tail.ts
### Keywords: ts

### ** Examples

## simple creation and plotting
x.Date <- as.Date("2003-02-01") + c(1, 3, 7, 9, 14) - 1
x <- zoo(rnorm(5), x.Date)
plot(x)
time(x)

## subsetting with numeric indexes
x[c(2, 4)]
## subsetting with index class
x[as.Date("2003-02-01") + c(2, 8)]

## different classes of indexes/times can be used, e.g. numeric vector
x <- zoo(rnorm(5), c(1, 3, 7, 9, 14))
## subsetting with numeric indexes then uses observation numbers
x[c(2, 4)]
## subsetting with index class can be enforced by I()
x[I(c(3, 9))]

## visualization
plot(x)
## or POSIXct
y.POSIXct <- ISOdatetime(2003, 02, c(1, 3, 7, 9, 14), 0, 0, 0)
y <- zoo(rnorm(5), y.POSIXct)
plot(y)

## create a constant series
z <- zoo(1, seq(4)[-2])

## create a 0-dimensional zoo series
z0 <- zoo(, 1:4)

## create a 2-dimensional zoo series
z2 <- zoo(matrix(1:12, 4, 3), as.Date("2003-01-01") + 0:3)

## create a factor zoo object
fz <- zoo(gl(2,5), as.Date("2004-01-01") + 0:9)

## create a zoo series with 0 columns
z20 <- zoo(matrix(nrow = 4, ncol = 0), 1:4)

## arithmetic on zoo objects intersects them first
x1 <- zoo(1:5, 1:5)
x2 <- zoo(2:6, 2:6)
10 * x1 + x2

## $ extractor for multivariate zoo series with column names
z <- zoo(cbind(foo = rnorm(5), bar = rnorm(5)))
z$foo
z$xyz <- zoo(rnorm(3), 2:4)
z

## add comments to a zoo object
comment(x1) <- c("This is a very simple example of a zoo object.",
  "It can be recreated using this R code: example(zoo)")
## comments are not output by default but are still there
x1
comment(x1)

# ifelse does not work with zoo but this works
# to create a zoo object which equals x1 at
# time i if x1[i] > x1[i-1] and 0 otherwise
(diff(x1) > 0) * x1

## zoo series with duplicated indexes
z3 <- zoo(1:8, c(1, 2, 2, 2, 3, 4, 5, 5))
plot(z3)
## remove duplicated indexes by averaging
lines(aggregate(z3, index(z3), mean), col = 2)
## or by using the last observation
lines(aggregate(z3, index(z3), tail, 1), col = 4)

## x1[x1 > 3] is not officially supported since
## x1 > 3 is of class "zoo", not "logical".
## Use one of these instead:
x1[which(x1 > 3)]
x1[coredata(x1 > 3)]
x1[as.logical(x1 > 3)]
subset(x1, x1 > 3)

## any class supporting the methods discussed can be used
## as an index class. Here are examples using complex numbers
## and letters as the time class.

z4 <- zoo(11:15, complex(real = c(1, 3, 4, 5, 6), imag = c(0, 1, 0, 0, 1)))
merge(z4, lag(z4))

z5 <- zoo(11:15, letters[1:5])
merge(z5, lag(z5))

# index values relative to 2001Q1
zz <- zooreg(cbind(a = 1:10, b = 11:20), start = as.yearqtr(2000), freq = 4)
zz[] <- mapply("/", as.data.frame(zz), coredata(zz[as.yearqtr("2001Q1")]))


## even though time index must be unique zoo (and read.zoo)
## will both allow creation of such illegal objects with
## a warning (rather than ana error) to give the user a 
## chance to fix them up.  Extracting and replacing times
## and aggregate.zoo will still work.
## Not run: 
##D # this gives a warning
##D # and then creates an illegal zoo object
##D z6 <- zoo(11:15, c(1, 1, 2, 2, 5))
##D z6
##D 
##D # fix it up by averaging duplicates
##D aggregate(z6, identity, mean)
##D 
##D # or, fix it up by taking last in each set of duplicates
##D aggregate(z6, identity, tail, 1)
##D 
##D # fix it up via interpolation of duplicate times
##D time(z6) <- na.approx(ifelse(duplicated(time(z6)), NA, time(z6)), na.rm = FALSE)
##D # if there is a run of equal times at end they
##D # wind up as NAs and we cannot have NA times
##D z6 <- z6[!is.na(time(z6))]
##D z6
##D 
##D x1. <- x1 <- zoo (matrix (1:12, nrow = 3), as.Date("2008-08-01") + 0:2)
##D colnames (x1) <- c ("A", "B", "C", "D")
##D x2 <- zoo (matrix (1:12, nrow = 3), as.Date("2008-08-01") + 1:3)
##D colnames (x2) <- c ("B", "C", "D", "E")
##D 
##D both.dates = as.Date (intersect (index (t1), index (t2)))
##D both.cols = intersect (colnames (t1), colnames (t2))
##D 
##D x1[both.dates, both.cols]
##D ## there is "[.zoo" but no "[<-.zoo" however four of the following
##D ## five examples work
##D 
##D ## wrong
##D ## x1[both.dates, both.cols] <- x2[both.dates, both.cols]
##D 
##D # 4 correct alternatives
##D # #1
##D window(x1, both.dates)[, both.cols] <- x2[both.dates, both.cols]
##D 
##D # #2. restore x1 and show a different way
##D x1 <- x1.
##D window(x1, both.dates)[, both.cols] <- window(x2, both.dates)[, both.cols]
##D 
##D # #3. restore x1 and show a different way
##D x1 <- x1.
##D x1[time(x1) ##D 
##D 
##D # #4. restore x1 and show a different way
##D x1 <- x1.
##D x1[time(x1) ##D 
##D 
## End(Not run)




