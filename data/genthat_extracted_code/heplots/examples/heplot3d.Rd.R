library(heplots)


### Name: heplot3d
### Title: Three-Dimensional HE Plots
### Aliases: heplot3d heplot3d.mlm
### Keywords: hplot aplot dynamic multivariate

### ** Examples

# Soils data, from car package
soils.mod <- lm(cbind(pH,N,Dens,P,Ca,Mg,K,Na,Conduc) ~ Block + Contour*Depth, data=Soils)
Anova(soils.mod)

heplot(soils.mod, variables=c("Ca", "Mg"))
pairs(soils.mod, terms="Depth", variables=c("pH", "N", "P", "Ca", "Mg"))

heplot3d(soils.mod, variables=c("Mg", "Ca", "Na"), wire=FALSE)

# Plastic data
plastic.mod <- lm(cbind(tear, gloss, opacity) ~ rate*additive, data=Plastic)
## Not run: 
##D heplot3d(plastic.mod, col=c("red", "blue", "brown", "green3"), wire=FALSE)
## End(Not run)



