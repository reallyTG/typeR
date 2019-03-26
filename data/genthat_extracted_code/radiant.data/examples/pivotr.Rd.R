library(radiant.data)


### Name: pivotr
### Title: Create a pivot table
### Aliases: pivotr

### ** Examples

pivotr(diamonds, cvars = "cut") %>% str()
pivotr(diamonds, cvars = "cut")$tab
pivotr(diamonds, cvars = c("cut","clarity","color"))$tab
pivotr(diamonds, cvars = "cut:clarity", nvar = "price")$tab
pivotr(diamonds, cvars = "cut", nvar = "price")$tab
pivotr(diamonds, cvars = "cut", normalize = "total")$tab




