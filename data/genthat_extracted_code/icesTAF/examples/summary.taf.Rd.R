library(icesTAF)


### Name: summary.taf
### Title: Summary Results in TAF Format
### Aliases: summary.taf

### ** Examples

summary.taf
x <- div(summary.taf, "Rec|TSB|SSB|Removals", grep=TRUE)
x <- rnd(x, "Rec|TSB|SSB|Removals", grep=TRUE)
x <- rnd(x, "Fbar", 3, grep=TRUE)



