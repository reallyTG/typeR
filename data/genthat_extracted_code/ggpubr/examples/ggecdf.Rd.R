library(ggpubr)


### Name: ggecdf
### Title: Empirical cumulative density function
### Aliases: ggecdf

### ** Examples

# Create some data format
set.seed(1234)
wdata = data.frame(
   sex = factor(rep(c("F", "M"), each=200)),
   weight = c(rnorm(200, 55), rnorm(200, 58)))

head(wdata, 4)

# Basic ECDF plot
ggecdf(wdata, x = "weight")

# Change colors and linetype by groups ("sex")
# Use custom palette
ggecdf(wdata, x = "weight",
   color = "sex", linetype = "sex",
   palette = c("#00AFBB", "#E7B800"))




