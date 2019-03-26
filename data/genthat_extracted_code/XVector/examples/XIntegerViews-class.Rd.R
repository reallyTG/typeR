library(XVector)


### Name: XIntegerViews-class
### Title: The XIntegerViews class
### Aliases: class:XIntegerViews XIntegerViews-class XIntegerViews
###   Views,XInteger-method Views,integer-method show,XIntegerViews-method
###   ==,XIntegerViews,XIntegerViews-method
###   ==,XIntegerViews,XInteger-method ==,XIntegerViews,integer-method
###   ==,XInteger,XIntegerViews-method ==,integer,XIntegerViews-method
### Keywords: methods classes

### ** Examples

## One standard way to create an XIntegerViews object is to use
## the Views() constructor:
subject <- as(c(45, 67, 84, 67, 45, 78), "XInteger")
v4 <- Views(subject, start=3:0, end=5:8)
v4
subject(v4)
length(v4)
start(v4)
end(v4)
width(v4)

## Attach a comment to views #3 and #4:
names(v4)[3:4] <- "out of limits"
names(v4)

## A more programatical way to "tag" the "out of limits" views:
idx <- start(v4) < 1 | end(v4) > length(subject(v4)) 
names(v4)[idx] <- "out of limits"

## Extract a view as an XInteger object:
v4[[2]]

## It is an error to try to extract an "out of limits" view:
## Not run: 
##D v4[[3]] # Error!
## End(Not run)

## Here the first view doesn't even overlap with the subject:
subject <- as(c(97, 97, 97, 45, 45, 98), "XInteger")
Views(subject, start=-3:4, end=-3:4 + c(3:6, 6:3))

## Views on a big XInteger subject:
subject <- XInteger(99999, sample(99, 99999, replace=TRUE) - 50)
v5 <- Views(subject, start=1:99*1000, end=1:99*1001)
v5
v5[-1]
v5[[5]]

## 31 adjacent views:
successiveViews(subject, 40:10)



