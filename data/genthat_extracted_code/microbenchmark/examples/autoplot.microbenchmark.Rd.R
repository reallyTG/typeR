library(microbenchmark)


### Name: autoplot.microbenchmark
### Title: Autoplot method for microbenchmark objects: Prettier graphs for
###   microbenchmark using ggplot2
### Aliases: autoplot.microbenchmark

### ** Examples

if (requireNamespace("ggplot2")) {

tm <- microbenchmark(rchisq(100, 0),
                     rchisq(100, 1),
                     rchisq(100, 2),
                     rchisq(100, 3),
                     rchisq(100, 5), times=1000L)
ggplot2::autoplot(tm)
}



