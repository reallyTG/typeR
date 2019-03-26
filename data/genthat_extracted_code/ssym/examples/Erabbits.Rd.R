library(ssym)


### Name: Erabbits
### Title: Age and Eye Lens Weight of Rabbits in Australia
### Aliases: Erabbits

### ** Examples

data("Erabbits", package="ssym")
plot(Erabbits$age, Erabbits$wlens, type="p", cex=0.3, lwd=3,
     ylab="Dry weight of eye lens (in milligrams)",
	 xlab="Age of the animal (in days)")



