library(lordif)


### Name: getcutoff
### Title: determines a cutoff threshold
### Aliases: getcutoff

### ** Examples

#top 1 percent
getcutoff(runif(1000),0.01,TRUE)
#bottom 1 percent
getcutoff(runif(1000),0.01,FALSE)



