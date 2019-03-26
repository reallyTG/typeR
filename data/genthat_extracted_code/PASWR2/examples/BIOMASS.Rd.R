library(PASWR2)


### Name: BIOMASS
### Title: Beech Trees
### Aliases: BIOMASS
### Keywords: datasets

### ** Examples

pairs(BIOMASS, col = "red", cex = 0.75)
plot(log(aboveweight) ~ log(diameter), data = BIOMASS)
# logarithmic axes
ggplot(data = BIOMASS, aes(x = diameter, y = aboveweight, color = log(stemweight))) + 
geom_point() + scale_x_log10() + scale_y_log10() + 
labs(x = "diameter of the stem in centimeters", y = "above ground weight in kilograms")



