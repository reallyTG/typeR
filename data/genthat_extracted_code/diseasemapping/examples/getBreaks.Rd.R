library(diseasemapping)


### Name: getBreaks
### Title: Age Breaks
### Aliases: getBreaks

### ** Examples

data('kentucky')
ageBreaks = getBreaks(names(kentucky), breaks=c(seq(0, 80, by=10), Inf))
ageBreaks



