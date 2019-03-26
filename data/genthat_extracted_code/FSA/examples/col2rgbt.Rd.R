library(FSA)


### Name: col2rgbt
### Title: Converts an R color to RGB (red/green/blue) including a
###   transparency (alpha channel).
### Aliases: col2rgbt
### Keywords: manip

### ** Examples

col2rgbt("black")
col2rgbt("black",1/4)
clrs <- c("black","blue","red","green")
col2rgbt(clrs)
col2rgbt(clrs,1/4)
trans <- (1:4)/5
col2rgbt(clrs,trans)




