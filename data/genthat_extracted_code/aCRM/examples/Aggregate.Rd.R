library(aCRM)


### Name: Aggregate
### Title: Aggregate numeric and categorical variables by an ID
### Aliases: Aggregate
### Keywords: Data Manipulation

### ** Examples

#Create some data
data <- data.frame(V1=as.factor(c('yes','no','no','yes','yes','yes','yes')),
                    V2=as.character(c(1,2,3,4,4,4,4)),V3=c(1:7),V4=as.numeric(c(7:1)))
ID=as.character(c(1,1,1,1,2,2,2))
#Demonstrate function
Aggregate(x=data,by=ID)



