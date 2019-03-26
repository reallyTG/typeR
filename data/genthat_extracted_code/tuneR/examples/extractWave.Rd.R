library(tuneR)


### Name: extractWave
### Title: Extractor for Wave and WaveMC objects
### Aliases: extractWave
### Keywords: manip utilities iplot

### ** Examples

Wobj <- sine(440)
# extracting the middle 0.5 seconds of that 1 sec. sound:
Wobj2 <- extractWave(Wobj, from = 0.25, to = 0.75, xunit = "time")
Wobj2

## Not run: 
##D # or interactively:
##D Wobj2 <- extractWave(Wobj)
## End(Not run)



