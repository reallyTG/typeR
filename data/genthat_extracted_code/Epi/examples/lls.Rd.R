library(Epi)


### Name: lls
### Title: Functions to manage and explore the workspace
### Aliases: lls clear
### Keywords: attributes

### ** Examples

x <- 1:10
y <- rbinom(10, 1, 0.5)
m1 <- glm( y ~ x, family=binomial )
M <- matrix( 1:20, 4, 5 )
.M <- M
dfr <- data.frame(x,y)
attach( dfr )
lls()
search()
clear()
search()
lls()
lls(all=TRUE)



