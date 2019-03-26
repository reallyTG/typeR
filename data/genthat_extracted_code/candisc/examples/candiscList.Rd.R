library(candisc)


### Name: candiscList
### Title: Canonical discriminant analyses
### Aliases: candiscList candiscList.mlm plot.candiscList print.candiscList
###   summary.candiscList
### Keywords: multivariate hplot

### ** Examples

grass.mod <- lm(cbind(N1,N9,N27,N81,N243) ~ Block + Species, data=Grass)

grass.canL <-candiscList(grass.mod)
names(grass.canL)
names(grass.canL$Species)

## Not run: 
##D print(grass.canL)
## End(Not run)
plot(grass.canL, type="n", ask=FALSE)
heplot(grass.canL$Species, scale=6)
heplot(grass.canL$Block, scale=2)




