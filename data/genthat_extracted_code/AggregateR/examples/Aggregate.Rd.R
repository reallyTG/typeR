library(AggregateR)


### Name: Aggregate
### Title: Aggregate numeric,Date and categorical variables by an ID
### Aliases: Aggregate

### ** Examples

# Example
# Create some data
data <- data.frame(V1=as.factor(c('yes','no','no','yes','yes','yes','yes')),
                   V2=as.character(c(1,2,3,4,4,4,4)),V3=c(1:7),V4=as.numeric(c(7:1)),
                   V5 = as.Date(as.Date('2014-12-03'):as.Date('2014-12-09'), origin = "1970-01-01")
                   )
ID=as.character(c(1,1,1,1,2,2,2))
Aggregate(x=data,by=ID)

# Examples of how to use the ... argument. See package dummy for details.
# library(dummmy)
# Aggregate(x=data,by=ID,object=categories(data))
# Aggregate(x=data,by=ID,p=2)



