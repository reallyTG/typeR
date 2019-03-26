library(gdata)


### Name: rename.vars
### Title: Remove or rename variables in a dataframe
### Aliases: rename.vars remove.vars
### Keywords: manip

### ** Examples

data <- data.frame(x=1:10,y=1:10,z=1:10)
names(data)
data <- rename.vars(data, c("x","y","z"), c("first","second","third"))
names(data)

data <- remove.vars(data, "second")
names(data)



