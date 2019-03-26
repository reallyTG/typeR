library(trip)


### Name: argos.sigma
### Title: Assign numeric values for Argos "class"
### Aliases: argos.sigma
### Keywords: manip

### ** Examples



cls <- ordered(sample(c("Z", "B", "A", "0", "1", "2", "3"), 30,
                      replace=TRUE),
               levels=c("Z", "B", "A", "0", "1", "2", "3"))
argos.sigma(cls)





