library(colorpatch)


### Name: theme_colorpatch
### Title: A ggplot2 theme for rendering colorpatches (black background)
### Aliases: theme_colorpatch

### ** Examples

library(ggplot2)
library(colorpatch)
dat <- CreateExampleData()
df <- ToDataFrame(dat)
p <- ggplot(df) + theme_colorpatch() + stat_colorpatch(aes(ratio=ratio,conf=conf,x=x,y=y))



