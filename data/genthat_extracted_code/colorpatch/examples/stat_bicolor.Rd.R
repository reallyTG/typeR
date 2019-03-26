library(colorpatch)


### Name: stat_bicolor
### Title: Plots a ratio/confidence plot using a bivariate colormap
### Aliases: stat_bicolor

### ** Examples

library(ggplot2)
library(colorpatch)
dat <- CreateExampleData()
df <- ToDataFrame(dat)
p <- ggplot(df) + theme_colorpatch() + stat_bicolor(aes(ratio=ratio,conf=conf,x=x,y=y))



