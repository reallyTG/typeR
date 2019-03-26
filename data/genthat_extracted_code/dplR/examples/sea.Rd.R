library(dplR)


### Name: sea
### Title: Superposed Epoch Analysis
### Aliases: sea
### Keywords: ts

### ** Examples
library(graphics)
library(utils)
data(cana157)
event.years <- c(1631, 1742, 1845)
cana157.sea <- sea(cana157, event.years)
foo <- cana157.sea$se.unscaled
names(foo) <- cana157.sea$lag
barplot(foo, col = ifelse(cana157.sea$p < 0.05, "grey30", "grey75"), 
        ylab = "RWI", xlab = "Superposed Epoch")



