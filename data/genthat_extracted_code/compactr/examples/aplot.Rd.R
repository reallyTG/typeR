library(compactr)


### Name: aplot
### Title: Create an empty plot with compact axis notation
### Aliases: aplot

### ** Examples

# run these lines one at a time to see what happens
par(mfrow = c(2,2))
eplot(xlim = c(-1, 1), ylim = c(0, 10))
aplot(main = "Hey Look! No axis labels.")
aplot(main = "But this one has them?!")
aplot(main = "And this one does just what you'd expect!")
# after a call to eplot() or aplot(), I just add
# whatever I want to the plot.



