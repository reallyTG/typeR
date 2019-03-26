library(ggalt)


### Name: stat_ash
### Title: Compute and display a univariate averaged shifted histogram
###   (polynomial kernel)
### Aliases: stat_ash

### ** Examples

# compare
library(gridExtra)
set.seed(1492)
dat <- data.frame(x=rnorm(100))
grid.arrange(ggplot(dat, aes(x)) + stat_ash(),
             ggplot(dat, aes(x)) + stat_bkde(),
             ggplot(dat, aes(x)) + stat_density(),
             nrow=3)

cols <- RColorBrewer::brewer.pal(3, "Dark2")
ggplot(dat, aes(x)) +
  stat_ash(alpha=1/2, fill=cols[3]) +
  stat_bkde(alpha=1/2, fill=cols[2]) +
  stat_density(alpha=1/2, fill=cols[1]) +
  geom_rug() +
  labs(x=NULL, y="density/estimate") +
  scale_x_continuous(expand=c(0,0)) +
  theme_bw() +
  theme(panel.grid=element_blank()) +
  theme(panel.border=element_blank())



