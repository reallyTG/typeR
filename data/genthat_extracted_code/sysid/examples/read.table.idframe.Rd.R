library(sysid)


### Name: read.table.idframe
### Title: Read the contents of a table-formatted file
### Aliases: read.table.idframe

### ** Examples

dataMatrix <- data.frame(matrix(rnorm(1000),ncol=5))
colnames(dataMatrix) <- c("u1","u2","y1","y2","y3")
write.csv(dataMatrix,file="test.csv",row.names=FALSE)
 
data <- read.table.idframe("test.csv",ninputs=2,unit="minutes")




