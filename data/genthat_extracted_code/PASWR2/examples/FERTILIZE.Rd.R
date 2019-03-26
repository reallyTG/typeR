library(PASWR2)


### Name: FERTILIZE
### Title: Cross and Auto Fertilization
### Aliases: FERTILIZE
### Keywords: datasets

### ** Examples

p <- ggplot(data = FERTILIZE, aes(x = height, color = fertilization))
p + geom_density()
t.test(height ~ fertilization, data = FERTILIZE)



