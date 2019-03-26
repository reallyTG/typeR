library(simba)


### Name: diffslope
### Title: Calculate the difference in slope or intercept of two regression
###   lines
### Aliases: diffslope diffslope2 diffic plot.dsl
### Keywords: methods univar

### ** Examples

data(abis)
names(abis.env) ##take a look at the data
pert.dist <- 1-vegdist(abis.env[,19:25], "euclidean") 
##calculate the distance (Euclidean) between the plots 
##regarding disturbance variables

soil.dist <- 1-vegdist(abis.env[,c(6,27:28)]) 
##calculate the similarity (Bray-Curtis) between the plots 
##regarding soil parameters

##calculate geographical distance between plots
coord.dist <- dist(abis.env[,1:2]) 

##transform all distance matrices into list format:
struc.dist.ls <- liste(pert.dist, entry="BC.struc")
soil.dist.ls <- liste(soil.dist, entry="BC.soil")
coord.dist.ls <- liste(coord.dist, entry="dist")

##create a data.frame containg plot information, geographical 
##distance,similarity of soil parameters, and similarity of 
##structural parameters:

df <- data.frame(coord.dist.ls, soil.dist.ls[,3], struc.dist.ls[,3])
names(df) ##see names

##give better names:
names(df)[4:5] <- c("soil","struc")
attach(df)

##prepare graphics device:
par(mfrow=c(2,1))

##plot and compare distance decay (decrease of similarity with 
##distance):
plot(dist, soil)
plot(dist, struc)
##remove problematic zero entries:
df <- subset(df, struc != 0)

##plot again, this time with regression lines (in red for better 
##visability):
detach(df)
attach(df)
plot(dist, soil)
abline(lm(soil~dist), col="red4")
plot(dist, struc)
abline(lm(struc~dist), col="red4")
##is the slope significantly different?
res <- diffslope(dist, soil, dist, struc)
res2 <- diffic(dist, soil, dist, struc)

##go for a coffee, as it takes a while...




