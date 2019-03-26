library(xts)


### Name: indexClass
### Title: Extracting/Replacing the Class of an xts Index
### Aliases: indexClass tclass indexFormat convertIndex indexClass<-
###   tclass<- indexFormat<- index.xts index<-.xts .indexhour .indexsec
###   .indexmin .indexyear .indexymon .indexyday .indexday .indexDate
###   .indexmday .indexwday .indexweek .indexmon .index .index<-
### Keywords: utilities

### ** Examples

x <- timeBasedSeq('2010-01-01/2010-01-02 12:00')
x <- xts(1:length(x), x)

# all obs. in the first 6 and last 3 minutes of the
# 8th and 15th hours on each day
x[.indexhour(x) %in% c(8,15) & .indexmin(x) %in% c(0:5,57:59)]

# change the index format
indexFormat(x) <- "%Y-%b-%d %H:%M:%OS3"
head(x)




