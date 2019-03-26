library(gbutils)


### Name: objectPad-class
### Title: Class "objectPad" objects and methods to store and retrieve
###   information
### Aliases: objectPad-class pad<-,objectPad-method
###   initialize,objectPad-method
### Keywords: internal

### ** Examples

# create a pad and store some info.
pa <- new("objectPad")
pad(pa,"apple") <- "fruit"
pad(pa,"sweets") <- "sweets"
# pad(pa,"apple","dentist") <- "keeps away from her/him"
# pad(pa,"sweets","dentist") <- "helps meeting her/him"
pad(pa,"young Gauss") <- 100*(100+1)/2
pad(pa,"layman") <- sum(1:100)

pad(pa,"apple")
pad(pa,"sweets")
# pad(pa,"apple","dentist")
# pad(pa,"sweets","dentist")
pad(pa,"young Gauss") - pad(pa,"layman")

# create a class of vectors with a pad
setClass("vecWithPad",representation(x="numeric",pad="objectPad"))
a <- new("vecWithPad",x=1:10)
pad(a,"mean") <- mean(a@x)    # Compute and store the mean, and
pad(a,"mean")                 # retrieve it



