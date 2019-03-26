library(MortalityTables)


### Name: setModification
### Title: Return a copy of the table with the given modification function
###   added
### Aliases: setModification setModification,mortalityTable-method

### ** Examples

mortalityTables.load("Austria_Census")
# Austrian census mortality 2011, with a lower floor of 0.1% death probability
at11.mod1perm = setModification(mort.AT.census.2011.male,
    modification = function(qx) {pmax(qx, 0.001)})
at11.mod1perm@name = paste(at11.mod1perm@name, "at least 0.1%")
# Austrian census mortality 2011, modified with 40% selection for ages
# below 60, vanishing linearly to age 80
at11.modSelection = setModification(mort.AT.census.2011.male,
    modification = function(qx) {
        qx * c(rep(0.6, 60), 0.6 + 0.4 * (0:20)/20, rep(1, length(qx)-81))
    })
at11.modSelection@name = paste(at11.modSelection@name, " 40% selection below 60")

plot(mort.AT.census.2011.male, at11.mod1perm, at11.modSelection,
    title = "Austrian census mortality with modifications", legend.position = c(0.99, 0.01))





