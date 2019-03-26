library(BSDA)


### Name: Toxic
### Title: Hazardous waste sites near minority communities
### Aliases: Toxic
### Keywords: datasets

### ** Examples


hist(Toxic$sites, col = "red")
hist(Toxic$minority, col = "blue")
qqnorm(Toxic$minority)
qqline(Toxic$minority)
boxplot(sites ~ region, data = Toxic, col = "lightgreen")
tapply(Toxic$sites, Toxic$region, median)
kruskal.test(sites ~ factor(region), data = Toxic)




