library(otuSummary)


### Name: otu4type
### Title: An example OTU table with samples and taxonomy in rows and otus
###   in columns
### Aliases: otu4type
### Keywords: datasets

### ** Examples

data(otu4type)
sapply(otu4type, class)
new <- typeConvert(otu4type)
sapply(new, class)



