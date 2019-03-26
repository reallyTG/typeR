library(MKmisc)


### Name: transformations
### Title: New Transformations for Use with ggplot2 Package
### Aliases: glog_trans glog10_trans glog2_trans scale_y_glog scale_x_glog
###   scale_y_glog10 scale_x_glog10 scale_y_glog2 scale_x_glog2
###   neglog_breaks neglog_trans neglog10_trans neglog2_trans
###   scale_y_neglog scale_x_neglog scale_y_neglog10 scale_x_neglog10
###   scale_y_neglog2 scale_x_neglog2
### Keywords: hplot

### ** Examples

library(ggplot2)
data(mpg)
p1 <- ggplot(mpg, aes(displ, hwy)) + geom_point()
p1
p1 + scale_x_log10()
p1 + scale_x_glog10()
p1 + scale_y_log10()
p1 + scale_y_glog10()

## A volcano plot
x <- matrix(rnorm(1000, mean = 10), nrow = 10)
g1 <- rep("control", 10)
y1 <- matrix(rnorm(500, mean = 11.25), nrow = 10)
y2 <- matrix(rnorm(500, mean = 9.75), nrow = 10)
g2 <- rep("treatment", 10)
group <- factor(c(g1, g2))
Data <- rbind(x, cbind(y1, y2))
pvals <- apply(Data, 2, function(x, group) t.test(x ~ group)$p.value,
               group = group)
## compute log-fold change
logfc <- function(x, group){
  res <- tapply(x, group, mean)
  log2(res[1]/res[2])
}
lfcs <- apply(Data, 2, logfc, group = group)
ps <- data.frame(pvals = pvals, logfc = lfcs)
ggplot(ps, aes(x = logfc, y = pvals)) + geom_point() +
    geom_hline(yintercept = 0.05) + scale_y_neglog10() +
    geom_vline(xintercept = c(-0.1, 0.1)) + xlab("log-fold change") +
    ylab("-log10(p value)") + ggtitle("A Volcano Plot")



