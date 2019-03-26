library(vegtable)


### Name: Extract
### Title: Select or replace elements in objects.
### Aliases: [<- [,vegtable-method [,vegtable,ANY,ANY,ANY-method
###   [<-,vegtable,ANY,ANY,ANY-method $,vegtable-method
###   $,coverconvert-method $<- $<-,vegtable-method $<-,vegtable,ANY-method
###   $<-,coverconvert,list-method
### Keywords: methods

### ** Examples

library(vegtable)
data(Kenya_veg)

## Range of latitude values in database
range(Kenya_veg$LATITUDE)

## Summary of countries
summary(Kenya_veg$COUNTRY)
summary(droplevels(Kenya_veg$COUNTRY))

## First 5 samples
summary(Kenya_veg[1:5,])



