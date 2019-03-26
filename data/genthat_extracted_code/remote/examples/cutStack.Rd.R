library(remote)


### Name: cutStack
### Title: Shorten a RasterStack
### Aliases: cutStack

### ** Examples

data(australiaGPCP)

# 6 layers from the beginning
cutStack(australiaGPCP, tail = FALSE, n = 6)
# 8 layers from the end
cutStack(australiaGPCP, tail = TRUE, n = 8)




