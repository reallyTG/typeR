library(peptider)


### Name: detect
### Title: Detection probability in a single library of size N
### Aliases: detect

### ** Examples

summary(detect())

require(ggplot2)
lib <- libscheme("NNK", 7)
qplot(detect(lib, size=10^8), weight=di, geom="histogram", data=lib$data)



