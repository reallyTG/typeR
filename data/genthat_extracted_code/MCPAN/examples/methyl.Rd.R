library(MCPAN)


### Name: methyl
### Title: NTP bioassay data: effect of methyleugenol on skin fibroma
### Aliases: methyl
### Keywords: datasets

### ** Examples

data(methyl)
# raw tumour proportions:
table(methyl[c("group", "tumour")])

# time of death:
boxplot(death~group, data=methyl, horizontal=TRUE)




