library(EngrExpt)


### Name: diagnostic
### Title: Consistency of diagnostic kits
### Aliases: diagnostic
### Keywords: datasets

### ** Examples

str(diagnostic)
show(plt1 <-
     xyplot(kit2 ~ kit1, diagnostic,
            aspect = "iso", type = c("g", "p"),
            xlab = "Measurement using kit 1",
            ylab = "Measurement using kit 2"))
tmd(plt1)
show(plt2 <-
     xyplot(kit2 ~ kit1, diagnostic, aspect = "iso",
            xlab = "Measurement using kit 1 - logarithmic axis",
            ylab = "Measurement using kit 2 - logarithmic axis",
            scales = list(log = 2)))
tmd(plt2)



