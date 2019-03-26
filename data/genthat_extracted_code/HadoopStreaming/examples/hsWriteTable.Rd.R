library(HadoopStreaming)


### Name: hsWriteTable
### Title: Calls write.table with defaults sensible for Hadoop streaming.
### Aliases: hsWriteTable

### ** Examples

d=data.frame(a=c('hi','yes','no'),b=c(1,2,3))
rownames(d) <- c('row1','row2','row3')
write.table(d)
hsWriteTable(d)



