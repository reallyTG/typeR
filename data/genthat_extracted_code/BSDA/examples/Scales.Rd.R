library(BSDA)


### Name: Scales
### Title: Readings obtained from a 100 pound weight placed on four brands
###   of bathroom scales
### Aliases: Scales
### Keywords: datasets

### ** Examples


boxplot(reading ~ brand, data = Scales, col = rainbow(4), 
ylab = "Weight (lbs)")
## Not run: 
##D library(ggplot2)
##D ggplot2::ggplot(data = Scales, aes(x = brand, y = reading, fill = brand)) + 
##D            geom_boxplot() + 
##D            labs(y = "weight (lbs)") +
##D            theme_bw() + 
##D            theme(legend.position = "none") 
## End(Not run)




