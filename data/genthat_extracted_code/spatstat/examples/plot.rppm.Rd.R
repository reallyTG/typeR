library(spatstat)


### Name: plot.rppm
### Title: Plot a Recursively Partitioned Point Process Model
### Aliases: plot.rppm
### Keywords: spatial hplot models

### ** Examples

    # Murchison gold data
    mur <- solapply(murchison, rescale, s=1000, unitname="km")
    mur$dfault <- distfun(mur$faults)
    # 
    fit <- rppm(gold ~ dfault + greenstone, data=mur)
    #
    opa <- par(mfrow=c(1,2))
    plot(fit)
    plot(fit, what="spatial")
    par(opa)



