library(activpalProcessing)


### Name: mvpa.min.AP
### Title: Estimate Time in Moderate-to-Vigorous Intensity Activity
### Aliases: mvpa.min.AP
### Keywords: activity

### ** Examples

data(second.by.second)
mets <- second.by.second.data$mets	

mvpa.min.AP(mets,epoch=1)

# summarize by date
tapply(second.by.second.data$mets, second.by.second.data$date,mvpa.min.AP,epoch=1)




