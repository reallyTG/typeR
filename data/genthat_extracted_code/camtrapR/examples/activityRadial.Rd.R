library(camtrapR)


### Name: activityRadial
### Title: Radial plots of single-species activity
### Aliases: activityRadial

### ** Examples


# load record table
data(recordTableSample)

species4activity <- "PBE"    # = Prionailurus bengalensis, Leopard Cat

activityRadial(recordTable       = recordTableSample,
               species           = species4activity,
               allSpecies        = FALSE,
               speciesCol        = "Species",
               recordDateTimeCol = "DateTimeOriginal",
               plotR             = TRUE,
               writePNG          = FALSE,
               lwd               = 5
)

# plot type = polygon

activityRadial(recordTable       = recordTableSample,
               species           = species4activity,
               allSpecies        = FALSE,
               speciesCol        = "Species",
               recordDateTimeCol = "DateTimeOriginal",
               plotR             = TRUE,
               writePNG          = FALSE,
               lwd               = 5,
               rp.type           = "p"      
)




