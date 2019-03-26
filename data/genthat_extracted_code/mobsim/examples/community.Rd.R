library(mobsim)


### Name: community
### Title: Create spatial community object
### Aliases: community

### ** Examples

x <- runif(100)
y <- runif(100)
species_names <- rep(paste("species",1:10, sep = ""), each = 10)

com1 <- community(x,y, species_names)
plot(com1)
summary(com1)




