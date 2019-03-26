library(FSA)


### Name: expandLenFreq
### Title: Expands a length frequency based on a subsample.
### Aliases: expandLenFreq
### Keywords: manip

### ** Examples

## Set the random seed for reproducibility
set.seed(15343437)

## First example
# random lengths measured to nearest 0.1 unit -- values in a vector
len1 <- round(runif(50,0.1,9.9),1)
# assignment of integer lengths to 110 non-measured individuals
new.len1a <- expandLenFreq(len1,w=1,total=160)
new.len1a
# assignment of lengths to 0.1 to 110 non-measured individuals
new.len1b <- expandLenFreq(len1,w=1,total=160,decimals=1)
new.len1b

## Second example -- if values are in a data.frame
# random lengths measured to nearest 0.1 unit
len2 <- data.frame(len=round(runif(50,10,117),1))
# assignment of lengths to 0.1 for 140 non-measured indivs
new.len2a <- expandLenFreq(len2$len,w=10,total=190,decimals=1)
new.len2a

## Third example
# hypothetically measured lengths
len <- c(6.7,6.9,7.3,7.4,7.5,8.2,8.7,8.9)
# find lengths for unmeasured fish assuming a total of 30
newlen1 <- expandLenFreq(len,w=0.5,total=30,decimals=1)
newlen1
# set a starting length category
newlen2 <- expandLenFreq(len,w=0.5,startcat=6.2,total=30,decimals=1)
newlen2




