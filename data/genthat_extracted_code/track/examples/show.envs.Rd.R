library(track)


### Name: show.envs
### Title: Show the environments referenced within an object.
### Aliases: show.envs
### Keywords: misc

### ** Examples

x <- data.frame(a=1:10, b=10:1)
m <- lm(a ~ b, data=x)
show.envs(m)



