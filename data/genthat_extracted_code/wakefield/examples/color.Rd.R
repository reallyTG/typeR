library(wakefield)


### Name: color
### Title: Generate Random Vector of Colors
### Aliases: color primary
### Keywords: color

### ** Examples

color(10)
pie(tab <- table(color(10000)), col = names(tab))

primary(10)
pie(tab <- table(primary(10000)), col = names(tab))
barplot(tab <- table(primary(10000, prob = probs(6))), col = names(tab))



