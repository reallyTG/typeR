library(PCRedux)


### Name: head2tailratio
### Title: A function to calculate to head to tail ratio of amplification
###   curve data from a quantitative PCR experiment
### Aliases: head2tailratio
### Keywords: head ratio tail

### ** Examples


# calculate head to tail ratio on amplification curve data

library(qpcR)

res_head2tailratio <- sapply(2:ncol(competimer), function(i) {
   head2tailratio(y=competimer[, i], normalize=TRUE, slope_normalizer=TRUE)
})

res_head2tailratio_cluster <- kmeans(res_head2tailratio, 3)$cluster

matplot(competimer[, 1], competimer[, -1], xlab="Cycle", ylab="RFU",
        main="competimer data set", type="l", lty=1, col=res_head2tailratio_cluster, lwd=2)




