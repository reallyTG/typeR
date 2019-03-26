library(pawacc)


### Name: aggAccFile
### Title: Aggregate Accelerometry Data
### Aliases: aggAccFile
### Keywords: collapse

### ** Examples


data(gt1m_sample)

# aggregate by 30-second epochs
aggAccFile(gt1m_sample, by = 30)

# aggregate by 5-minute epochs
aggAccFile(gt1m_sample, by = 300, keep.error = FALSE)




