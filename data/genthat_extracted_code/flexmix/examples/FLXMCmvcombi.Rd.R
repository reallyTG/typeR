library(flexmix)


### Name: FLXMCmvcombi
### Title: FlexMix Binary and Gaussian Clustering Driver
### Aliases: FLXMCmvcombi
### Keywords: cluster

### ** Examples

## create some artificial data
x1 <- cbind(rnorm(300),
            sample(0:1, 300, replace = TRUE, prob = c(0.25, 0.75)))
x2 <- cbind(rnorm(300, mean = 2, sd = 0.5),
            sample(0:1, 300, replace = TRUE, prob = c(0.75, 0.25)))
x <- rbind(x1, x2)

## fit the model
f1 <- flexmix(x ~ 1, k = 2, model = FLXMCmvcombi())
## should be similar to the original parameters
parameters(f1)
table(clusters(f1), rep(1:2, c(300,300)))

## a column with noise should not hurt too much
x <- cbind(x, rnorm(600))
f2 <- flexmix(x ~ 1, k = 2, model = FLXMCmvcombi())
parameters(f2)
table(clusters(f2), rep(1:2, c(300,300)))




