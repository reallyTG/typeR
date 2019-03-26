library(PKreport)


### Name: PKconfig
### Title: Data configuration
### Aliases: PKconfig
### Keywords: methods

### ** Examples

# setup configuration
general.list <- list(save.format="bmp", width = 480, height = 480, package=2)
hist.list <- list(type=c("count"), layout=c(1,1), ind.layout=c(5,5))
scatter.list <- list(span=0.25, type=c("p", "smooth"), layout=c(1,1), ind.layout=c(5,5))

PKconfig(general.list, hist.list, scatter.list)



