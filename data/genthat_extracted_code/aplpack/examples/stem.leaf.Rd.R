library(aplpack)


### Name: stem.leaf
### Title: stem and leaf display and back to back stem and leaf display
### Aliases: stem.leaf stem.leaf.backback
### Keywords: misc

### ** Examples

stem.leaf(co2)
stem.leaf.backback(co2[1:120],co2[121:240])
stem.leaf.backback(co2[1:120],co2[121:240], back.to.back = FALSE)
stem.leaf.backback(co2[1:120],co2[121:240], back.to.back = FALSE,
                   add.more.blanks = 3, show.no.depths = TRUE)
stem.leaf.backback(rivers[-(1:30)],rivers[1:30], back.to.back = FALSE, unit=10, m=5, 
                   Min=200, Max=900, add.more.blanks = 20, show.no.depths = TRUE)



