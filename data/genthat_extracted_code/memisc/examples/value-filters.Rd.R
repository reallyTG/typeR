library(memisc)


### Name: value.filter
### Title: Value Filters
### Aliases: value.filter value.filter-class value.filter,item-method
###   missing.values-class valid.values-class valid.range-class
###   missing.values missing.values,item.vector-method missing.values<-
###   missing.values<-,ANY,atomic-method missing.values<-,ANY,list-method
###   missing.values<-,item,NULL-method missing.values<-,item,ANY-method
###   missing.values<-,item,missing.values-method
###   missing.values<-,atomic,missing.values-method valid.values
###   valid.values,item.vector-method valid.values<-
###   valid.values<-,ANY,atomic-method
###   valid.values<-,item,valid.values-method
###   valid.values<-,atomic,valid.values-method valid.range
###   valid.range,item.vector-method valid.range<-
###   valid.range<-,ANY,atomic-method valid.range<-,item,valid.range-method
###   valid.range<-,atomic,valid.range-method format,valid.values-method
###   format,valid.range-method format,missing.values-method
###   show,value.filter-method coerce,atomic,valid.values-method
###   coerce,atomic,valid.range-method coerce,atomic,missing.values-method
###   coerce,list,missing.values-method
###   Arith,valid.values,valid.values-method
###   Arith,missing.values,missing.values-method
###   Arith,valid.range,valid.range-method Arith,value.filter,vector-method
###   is.valid is.missing is.missing,item.vector-method
###   is.missing,atomic-method is.missing,factor-method include.missings
###   include.missings,item-method nvalid

### ** Examples

x <- rep(c(1:4,8,9),2,length=60)
labels(x) <- c(
    a=1,
    b=2,
    c=3,
    d=4,
    dk=8,
    refused=9
    )
missing.values(x) <- 9
missing.values(x)
missing.values(x) <- missing.values(x) + 8
missing.values(x)
missing.values(x) <- NULL
missing.values(x)
missing.values(x) <- list(range=c(8,Inf))
missing.values(x)
valid.values(x)
print(x)
is.missing(x)
is.valid(x)
as.factor(x)
as.factor(include.missings(x))
as.integer(x)
as.integer(include.missings(x))



