library(yarrr)


### Name: apa
### Title: apa
### Aliases: apa
### Keywords: apa

### ** Examples


x <- rnorm(100)
y <- x + rnorm(100)
a <- sample(1:3, size = 200, prob = c(.3, .2, .5), replace = TRUE)
b <- sample(1:3, size = 200, prob = c(.3, .2, .5), replace = TRUE)

apa(t.test(x, y))
apa(cor.test(x, y))
apa(chisq.test(table(a, b)))






