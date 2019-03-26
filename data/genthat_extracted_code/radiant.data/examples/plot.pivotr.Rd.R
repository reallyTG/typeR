library(radiant.data)


### Name: plot.pivotr
### Title: Plot method for the pivotr function
### Aliases: plot.pivotr

### ** Examples

pivotr(diamonds, cvars = "cut") %>% plot()
pivotr(diamonds, cvars = c("cut", "clarity")) %>% plot()
pivotr(diamonds, cvars = c("cut", "clarity", "color")) %>% plot()




