library(SDEFSR)


### Name: SDEFSR_DatasetFromDataFrame
### Title: Creates a 'SDEFSR_Dataset' object from a 'data.frame'
### Aliases: SDEFSR_DatasetFromDataFrame

### ** Examples

library(SDEFSR)
df <- data.frame(matrix(runif(1000), ncol = 10))
#Add class attribute
df[,11] <- c("0", "1", "2", "3")
SDEFSR_DatasetObject <- SDEFSR_DatasetFromDataFrame(df, "random")
invisible()




