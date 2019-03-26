library(gren)


### Name: denet
### Title: The elastic net prior distribution
### Aliases: denet renet

### ** Examples

## Create data
n <- 100
x <- renet(n)
hist(x)

## Calculate density
dens <- denet(x)
plot(sort(x), dens[order(x)])



