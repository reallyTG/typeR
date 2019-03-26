library(aCRM)


### Name: imputeMissings
### Title: Impute missing values with the median or mode.
### Aliases: imputeMissings
### Keywords: Data Manipulation

### ** Examples

#create some data
data <- data.frame(V1=as.factor(c('yes','no','no',NA,'yes','yes','yes')),
                   V2=as.character(c(1,2,3,4,4,4,NA)),
                   V3=c(1:6,NA),V4=as.numeric(c(1:6,NA)))
#demonstrate function
imputeMissings(data)



