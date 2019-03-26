library(PASWR)


### Name: vit2005
### Title: Apartments in Vitoria
### Aliases: vit2005
### Keywords: datasets

### ** Examples

modTotal <- lm(totalprice~area+as.factor(elevator) + 
area:as.factor(elevator), data = vit2005)
modSimpl <- lm(totalprice~area, data = vit2005)
anova(modSimpl,modTotal)
rm(modSimpl, modTotal)



