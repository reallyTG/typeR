library(lfstat)


### Name: summary.deficit
### Title: Object Summaries
### Aliases: summary.deficit
### Keywords: low-flow print

### ** Examples

data(ray)
ray <- as.xts(ray)["1970::1970", ]
r <- find_droughts(ray, threshold = 0.02)
summary(r)      # minor events got filtered

summary(r, drop_minor = 0)      # no filtering
summary(r, drop_minor = c("volume" = 10000, "duration" = 5))
summary(r, drop_minor = c("volume" = "10%", "duration" = 5))



