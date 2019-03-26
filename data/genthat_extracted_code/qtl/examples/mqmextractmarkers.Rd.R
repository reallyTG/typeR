library(qtl)


### Name: mqmextractmarkers
### Title: MQM marker extraction
### Aliases: mqmextractmarkers
### Keywords: utilities

### ** Examples

data(multitrait)

multitrait <- fill.geno(multitrait)

result <- mqmscan(multitrait)
newresult <- mqmextractmarkers(result)



