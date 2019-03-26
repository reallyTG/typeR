library(BSDA)


### Name: Golf
### Title: Distances a golf ball can be driven by 20 professional golfers
### Aliases: Golf
### Keywords: datasets

### ** Examples


stem(Golf$yards)
qqnorm(Golf$yards)
qqline(Golf$yards)

## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Golf, aes(sample = yards)) + 
##D            geom_qq() + 
##D            theme_bw()
## End(Not run)




