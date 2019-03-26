library(zCompositions)


### Name: zPatterns
### Title: Find and display patterns of zeros or unobserved values in a
###   data set
### Aliases: zPatterns
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(LPdata)

pattern.ID <- zPatterns(LPdata,label=0)

LPdata[pattern.ID==5,]
LPdata[pattern.ID==7,]
LPdata[pattern.ID==10,]

# Modify cell labels and show percentages along with barplots
pattern.ID <- zPatterns(LPdata,label=0,
              cell.labels=c("Zero","Non-zero"),bar.labels=TRUE)




