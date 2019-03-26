library(dpcR)


### Name: df2dpcr
### Title: Convert data.frame to dpcr object
### Aliases: df2dpcr
### Keywords: utilities

### ** Examples

dat <- data.frame(experiment = factor(rep(paste0("Experiment", 1L:2), 3)),
                  replicate = c(1, 1, 2, 2, 3, 3),
                  assay = "Assay1",
                  k = c(55, 121, 43, 150, 70, 131),
                  n = 765,
                  v = 1,
                  uv = 0)
df2dpcr(dat)



