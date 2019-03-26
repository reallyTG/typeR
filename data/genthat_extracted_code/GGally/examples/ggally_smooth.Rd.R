library(GGally)


### Name: ggally_smooth
### Title: Plots the Scatter Plot with Smoothing
### Aliases: ggally_smooth ggally_smooth_loess ggally_smooth_lm
### Keywords: hplot

### ** Examples

 data(tips, package = "reshape")
 ggally_smooth(tips, mapping = ggplot2::aes(x = total_bill, y = tip))
 ggally_smooth(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "tip"))
 ggally_smooth(tips, mapping = ggplot2::aes_string(x = "total_bill", y = "tip", color = "sex"))



