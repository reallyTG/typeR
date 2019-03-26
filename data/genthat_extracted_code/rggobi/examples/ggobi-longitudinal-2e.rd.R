library(rggobi)


### Name: ggobi_longitudinal
### Title: Create longitudinal dataset.
### Aliases: ggobi_longitudinal
### Keywords: dynamic

### ** Examples
data(Oxboys, package="nlme")
if (interactive()) {
ggobi_longitudinal(Oxboys, Occasion, Subject)
ggobi_longitudinal(stormtracks, seasday, id)
ggobi_longitudinal(data.frame(x=1:100, y=sin(1:100)))}


