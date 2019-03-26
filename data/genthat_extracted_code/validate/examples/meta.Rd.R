library(validate)


### Name: meta
### Title: Get or set rule metadata
### Aliases: meta meta<- meta,rule-method meta<-,rule,character-method
###   meta,expressionset-method meta<-,expressionset,character-method

### ** Examples


v <- validator(x > 0, y > 0)

# metadata is recycled over rules
meta(v,"foo") <- "bar" 

# assign metadata to a selection of rules
meta(v[1],"fu") <- 2

# retrieve metadata as data.frame
meta(v)

# retrieve metadata as list
meta(v,simplify=TRUE)




