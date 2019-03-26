library(rjags)


### Name: control
### Title: Advanced control over JAGS
### Aliases: list.factories set.factory
### Keywords: models

### ** Examples

list.factories("sampler")
list.factories("monitor")
list.factories("rng")
set.factory("base::Slice", "sampler", FALSE)
list.factories("sampler")
set.factory("base::Slice", "sampler", TRUE)



