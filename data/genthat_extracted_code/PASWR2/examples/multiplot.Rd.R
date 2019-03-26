library(PASWR2)


### Name: multiplot
### Title: Complex Plot Arrangements for ggplot Objects
### Aliases: multiplot
### Keywords: programming

### ** Examples

p1 <- ggplot(data = HSWRESTLER, aes(x = skfat, y = hwfat)) + geom_point()
p2 <- ggplot(data = HSWRESTLER, aes(x = tanfat, y = hwfat)) + geom_point()
multiplot(p1, p2, cols = 2)
multiplot(p1, p2, cols = 2, layout=matrix(c(1, 0, 0, 2), byrow = TRUE, nrow = 2))




