library(PASWR2)


### Name: VIT2005
### Title: Apartments in Vitoria
### Aliases: VIT2005
### Keywords: datasets

### ** Examples

ggplot(data = VIT2005, aes(x = area, y = totalprice, color = factor(elevator))) + 
geom_point()
modTotal <- lm(totalprice ~ area + as.factor(elevator) + area:as.factor(elevator), 
data = VIT2005)
modSimpl <- lm(totalprice ~ area, data = VIT2005)
anova(modSimpl, modTotal)
rm(modSimpl, modTotal)



