library(ggpubr)


### Name: ggqqplot
### Title: QQ Plots
### Aliases: ggqqplot

### ** Examples

# Create some data format
set.seed(1234)
wdata = data.frame(
   sex = factor(rep(c("F", "M"), each=200)),
   weight = c(rnorm(200, 55), rnorm(200, 58)))

head(wdata, 4)

# Basic QQ plot
ggqqplot(wdata, x = "weight")

# Change colors and shape by groups ("sex")
# Use custom palette
ggqqplot(wdata, x = "weight",
   color = "sex", palette = c("#00AFBB", "#E7B800"))




