library(Tmisc)


### Name: counts2fpkm
### Title: Fragments per kilobase per million
### Aliases: counts2fpkm

### ** Examples

## Not run: 
##D library(readr)
##D library(dplyr)
##D countdata <- read_csv("http://files.figshare.com/2439061/GSE37704_featurecounts.csv") 
##D counts <- countdata %>% select(countdata, starts_with("SRR")) %>% as.matrix
##D counts2fpkm(counts, countdata$length)
## End(Not run)
  



