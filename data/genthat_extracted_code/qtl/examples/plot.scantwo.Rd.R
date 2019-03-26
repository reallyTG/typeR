library(qtl)


### Name: plot.scantwo
### Title: Plot LOD scores for a two-dimensional genome scan
### Aliases: plot.scantwo
### Keywords: hplot

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, chr=c(1,4,6,15))
## End(Don't show)
hyper <- calc.genoprob(hyper, step=5)
## Don't show: 
hyper <- calc.genoprob(hyper)
## End(Don't show)

# 2-d scan by EM and by Haley-Knott regression
out2.em <- scantwo(hyper, method="em")
out2.hk <- scantwo(hyper, method="hk")

# plot epistasis and full LOD scores
plot(out2.em)

# plot cond-int in upper triangle and full in lower triangle
#     for chromosomes 1, 4, 6, 15
plot(out2.em, upper="cond-int", chr=c(1,4,6,15))

# plot cond-add in upper triangle and add in lower triangle
#     for chromosomes 1, 4
plot(out2.em, upper="cond-add", lower="add", chr=c(1,4))

# plot the differences between the LOD scores from Haley-Knott
#     regression and the EM algorithm
plot(out2.hk - out2.em, allow.neg=TRUE)



