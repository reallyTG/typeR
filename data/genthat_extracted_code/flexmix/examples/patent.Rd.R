library(flexmix)


### Name: patent
### Title: Patents and R&D Spending
### Aliases: patent
### Keywords: datasets

### ** Examples

data("patent", package = "flexmix")
patentMix <- initFlexmix(Patents ~ lgRD, k = 3,
                         model = FLXMRglm(family = "poisson"),
                         concomitant = FLXPmultinom(~RDS),
                         nrep = 5, data = patent)
plot(Patents ~ lgRD, data = patent,
     pch = as.character(clusters(patentMix)))
ordering <- order(patent$lgRD)
apply(fitted(patentMix), 2, function(y)
      lines(sort(patent$lgRD), y[ordering]))



