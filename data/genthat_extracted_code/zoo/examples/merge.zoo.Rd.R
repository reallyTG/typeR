library(zoo)


### Name: merge.zoo
### Title: Merge Two or More zoo Objects
### Aliases: merge.zoo rbind.zoo c.zoo cbind.zoo
### Keywords: ts

### ** Examples

## simple merging
x.date <- as.Date(paste(2003, 02, c(1, 3, 7, 9, 14), sep = "-"))
x <- zoo(rnorm(5), x.date)

y1 <- zoo(matrix(1:10, ncol = 2), 1:5)
y2 <- zoo(matrix(rnorm(10), ncol = 2), 3:7)

## using arguments `fill' and `suffixes'
merge(y1, y2, all = FALSE)
merge(y1, y2, all = FALSE, suffixes = c("a", "b"))
merge(y1, y2, all = TRUE)
merge(y1, y2, all = TRUE, fill = 0)

## if different index classes are merged, as in
## the next merge example then ## a warning is issued and 
### the indexes are coerced.
## It is up to the user to ensure that the result makes sense.
merge(x, y1, y2, all = TRUE)

## extend an irregular series to a regular one:
# create a constant series
z <- zoo(1, seq(4)[-2])
# create a 0 dimensional zoo series
z0 <- zoo(, 1:4)
# do the extension
merge(z, z0)
# same but with zero fill
merge(z, z0, fill = 0)

merge(z, coredata(z),  1)


## merge multiple series represented in a long form data frame 
## into a multivariate zoo series and plot, one series for each site.
## Additional examples can be found here:
## https://stat.ethz.ch/pipermail/r-help/2009-February/187094.html
## https://stat.ethz.ch/pipermail/r-help/2009-February/187096.html
##
m <- 5 # no of years
n <- 6 # no of sites
sites <- LETTERS[1:n]
set.seed(1)
DF <- data.frame(site = sites, year = 2000 + 1:m, data = rnorm(m*n))
tozoo <- function(x) zoo(x$data, x$year) 
Data <- do.call(merge, lapply(split(DF, DF$site), tozoo))
plot(Data, screen = 1, col = 1:n, pch = 1:n, type = "o", xlab = "")
legend("bottomleft", legend = sites, lty = 1, pch = 1:n, col = 1:n)

## for each index value in x merge it with the closest index value in y
## but retaining x's times.
x<-zoo(1:3,as.Date(c("1992-12-13", "1997-05-12", "1997-07-13")))
y<-zoo(1:5,as.Date(c("1992-12-15", "1992-12-16", "1997-05-10","1997-05-19", "1997-07-13")))
f <- function(u) which.min(abs(as.numeric(index(y)) - as.numeric(u)))
ix <- sapply(index(x), f)
cbind(x, y = coredata(y)[ix])

## this merges each element of x with the closest time point in y at or
## after x's time point (whereas in previous example it could be before
## or after)
window(na.locf(merge(x, y), fromLast = TRUE), index(x))


## c() can combine several zoo series, e.g., zoo series with Date index
z <- zoo(1:5, as.Date("2000-01-01") + 0:4)
z2 <- zoo(6:7, time(z)[length(z)] + 1:2)

## c() combines these in a single series
c(z, z2)

## the order does not matter
c(z2, z)

## note, however, that combining a zoo series with an unclassed vector
## of observations coerces to zoo/Date first and can give unexpected results
c(z, 6:7)




