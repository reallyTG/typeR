library(colorpatch)


### Name: CreateExampleData
### Title: Creates demonstration data of the colorpatch package
### Aliases: CreateExampleData

### ** Examples

library(ggplot2)
library(colorpatch)
dat <- CreateExampleData()
df <- ToDataFrame(dat)
p <- ggplot(df, aes(x = x, y = y, ratio = ratio, conf = conf)) 
p <- p + theme_colorpatch() + coord_fixed(ratio = 1)  + stat_colorpatch()
plot(p)



