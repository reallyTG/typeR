library(LIM)


### Name: LIMEverglades
### Title: Linear inverse model specification for the herpetological food
###   web of the Everglades
### Aliases: LIMEverglades
### Keywords: datasets

### ** Examples


# Cannot be solved, but the least squares solution is found
Flows <- Lsei(LIMEverglades, parsimonious = TRUE)
Everglades <- Flowmatrix(LIMEverglades)
plotweb(Everglades, main = "Everglades Herpetological Wet Prairie model",
        sub = "g WW/Ha/Yr", lab.size = 0.8)



