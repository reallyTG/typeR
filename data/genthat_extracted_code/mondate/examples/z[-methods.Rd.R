library(mondate)


### Name: [-methods
### Title: Extraction Method for Mondates
### Aliases: [-methods [,mondate-method head head.mondate tail tail.mondate
### Keywords: methods

### ** Examples

(m<-structure(mondate.ymd(2001:2010,12,31),names=LETTERS[1:10]))
m[1]
m[2:5]
head(m)
tail(m,2)

(M<-cbind(m-12,m,m+12, deparse.level=2))  # a matrix
M[1:5,1:2]    # '[' works with matrix mondates
head(M,2)  # as does 'head'




