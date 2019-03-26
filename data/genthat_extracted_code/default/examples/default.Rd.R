library(default)


### Name: default
### Title: change a function's default arguments
### Aliases: default default<- reset_default

### ** Examples

# list the default arguments for a function
default(data.frame)

# change one or more of them
default(data.frame) <- list(fix.empty.names = FALSE)
data.frame(1:3)

# reset the defaults
data.frame <- reset_default(data.frame)
data.frame(1:3)



