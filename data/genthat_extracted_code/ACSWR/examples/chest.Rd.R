library(ACSWR)


### Name: chest
### Title: The Militiamen's Chest Dataset
### Aliases: chest
### Keywords: rootogram, militiamen

### ** Examples

data(chest)
attach(chest)
names(chest)
militiamen <- rep(Chest,Count)
length(militiamen)
bins <- seq(33,48)
bins
bin.mids <- (bins[-1]+bins[-length(bins)])/2
par(mfrow=c(1,2))
h <- hist(militiamen, breaks = bins, xlab= "Chest Measurements (Inches)",
main= "A: Histogram for the Militiamen")
h$counts <- sqrt(h$counts)
plot(h,xlab= "Chest Measurements (Inches)",ylab= "ROOT FREQUENCY",
main= "B: Rootogram for the Militiamen")



