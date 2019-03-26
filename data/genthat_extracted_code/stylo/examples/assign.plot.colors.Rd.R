library(stylo)


### Name: assign.plot.colors
### Title: Assign colors to samples
### Aliases: assign.plot.colors

### ** Examples

# in this example, three discrete classes are specified, 
# for Tacitus, Caesar, and Livius
sample.names = c("Tacitus_Annales","Tacitus_Germania","Tacitus_Histories",
                 "Caesar_Civil_wars","Caesar_Gallic_wars",
                 "Livius_Ab_Urbe_Condita")
assign.plot.colors(sample.names)

# as above, but using greyscale:
assign.plot.colors(sample.names, col = "greyscale")



