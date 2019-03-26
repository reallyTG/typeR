library(rggobi)


### Name: "[.GGobi"
### Title: Get ggobi data.
### Aliases: [.GGobi [[.GGobi $.GGobi
### Keywords: manip

### ** Examples

if (interactive()) {
g <- ggobi(ChickWeight)
g["cars"] <- mtcars
g[1:2]
g["ChickWeight"]
g["cars"]
g$cars}


