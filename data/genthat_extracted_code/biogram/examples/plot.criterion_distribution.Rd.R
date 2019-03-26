library(biogram)


### Name: plot.criterion_distribution
### Title: Plot criterion distribution
### Aliases: plot.criterion_distribution

### ** Examples

target_feature <- create_feature_target(10, 375, 15, 600) 
example_result <- distr_crit(target = target_feature[,1], 
                             feature = target_feature[,2])
plot(example_result)

# a ggplot2 plot
library(ggplot2)
ggplot_distr <- function(x) {
b <- data.frame(cbind(x=as.numeric(rownames(attr(x, "plot_data"))), 
                      attr(x, "plot_data")))
d1 <- cbind(b[,c(1,2)], attr(x, "nice_name"))
d2 <- cbind(b[,c(1,3)], "Probability")
colnames(d1) <- c("x", "y", "panel")
colnames(d2) <- c("x", "y", "panel")
d <- rbind(d1, d2)
p <- ggplot(data = d, mapping = aes(x = x, y = y)) + 
  facet_grid(panel~., scale="free") + 
  geom_freqpoly(data= d2, aes(color=y), stat = "identity") + 
  scale_fill_brewer(palette = "Set1") + 
  geom_point(data=d1, aes(size=y), stat = "identity") + 
  guides(color = "none") + 
  guides(size = "none") + 
  xlab("Number of cases with feature=1 and target=1") + ylab("")
p
}
ggplot_distr(example_result)




