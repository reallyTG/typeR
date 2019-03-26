library(TRAMPR)


### Name: build.knowns
### Title: Automatically Build Knowns Database
### Aliases: build.knowns
### Keywords: multivariate cluster datagen

### ** Examples

data(demo.samples)
demo.knowns.auto <- build.knowns(demo.samples, min.comb=4)
plot(demo.knowns.auto, cex=.75)



