library(RevEcoR)


### Name: reconstructGsMN
### Title: Reconstuction of the specific-organism genome-scale metabolic
###   network
### Aliases: reconstructGsMN

### ** Examples

## not run (organism in KEGG)
## metabolic.data <- getOrgMetabolicData("buc")
## g <- reconstructGsMN(metabolic.data)

## species detected in a human microbiome
annodir <- system.file("extdata","koanno.tab",package = "RevEcoR")
metabolic.data <- read.delim2(file=annodir,stringsAsFactors=FALSE)
##load the reference metabolic data
data(RefDbcache)
g2 <- reconstructGsMN(metabolic.data, RefData = RefDbcache)




