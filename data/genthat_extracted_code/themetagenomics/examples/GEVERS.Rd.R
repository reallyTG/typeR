library(themetagenomics)


### Name: GEVERS
### Title: Inflammatory bowel disease gut microbiome data
### Aliases: GEVERS
### Keywords: datasets

### ** Examples

hist(log(GEVERS$OTU + 1),100)
table(GEVERS$META$DIAGNOSIS)
boxplot(subset(GEVERS$META,DIAGNOSIS == 'CD')[['PCDAI']])



