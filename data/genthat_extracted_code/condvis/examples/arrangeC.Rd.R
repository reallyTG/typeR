library(condvis)


### Name: arrangeC
### Title: Make a list of variable pairings for condition selecting plots
###   produced by plotxc
### Aliases: arrangeC

### ** Examples

data(powerplant)

pairings <- arrangeC(powerplant)

dev.new(height = 2, width = 2 * length(pairings))
par(mfrow = c(1, length(pairings)))

for (i in seq_along(pairings)){
 plotxc(powerplant[, pairings[[i]]], powerplant[1, pairings[[i]]],
   select.col = NA)
}




