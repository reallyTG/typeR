library(Thermimage)


### Name: locate.fid
### Title: Returns the index locations that match vector fid within data
###   vector.
### Aliases: locate.fid

### ** Examples


# Similar to the which or match functions in package::base, except that this returns the 
# index placement where variable fid occurs in data

## Define a vector
s<-c(2,3,42,38,88,33,55,99,32,56,22,48,1,2,3,5,6,7,8,9,10,12,20)
## Define what fid sequence to look for: i.e. what adjacent elements to look for in 
## this order
fid<-c(22,48)
## look for all instances where 22 and 48 occur together, using locate.fid
system.time(where.locate<-locate.fid(fid,s,long=FALSE))
where.locate
## verify that locate.fid worked by subsetting s, using where.locate as index
s[where.locate]
system.time(where.locate<-locate.fid(fid,s,long=TRUE))
s[where.locate]

## longer algorithm check
### Define a vector of 100000 random numbers from 1 to 100
s<-ceiling(runif(100000, 0, 100))
## Define what fid sequence to look for: i.e. what adjacent elements to look for in 
## this order
fid<-c(22,48)
system.time(where.locate<-locate.fid(fid,s,long=TRUE))
where.locate
## verify that locate.fid worked by subsetting s, using where.locate as index
s[where.locate]




