library(zoo)


### Name: index
### Title: Extracting/Replacing the Index of Objects
### Aliases: index index.default index.zoo index.ts time.zoo index<-
###   index<-.zoo time<- time<-.zoo start.zoo end.zoo
### Keywords: ts

### ** Examples

x.date <- as.Date(paste(2003, 2, c(1, 3, 7, 9, 14), sep = "-"))
x <- zoo(rnorm(5), x.date)

## query index/time of a zoo object
index(x)
time(x)

## change class of index from Date to POSIXct
## relative to current time zone
x
index(x) <- as.POSIXct(format(time(x)),tz="")
x

## replace index/time of a zoo object
index(x) <- 1:5
x
time(x) <- 6:10
x

## query start and end of a zoo object
start(x)
end(x)

## query index of a usual matrix
xm <- matrix(rnorm(10), ncol = 2)
index(xm)



