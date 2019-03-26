library(taRifx)


### Name: stack.list
### Title: Stack lists into data.frames
### Aliases: stack.list

### ** Examples

dat <- replicate(10, data.frame(x=runif(2),y=rnorm(2)), simplify=FALSE)
str(dat)
stack(dat)



