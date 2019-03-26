library(stream)


### Name: DSD_Memory
### Title: A Data Stream Interface for Data Stored in Memory
### Aliases: DSD_Memory

### ** Examples

# store 1000 points from a stream
stream <- DSD_Gaussians(k=3, d=2)
replayer <- DSD_Memory(stream, k=3, n=1000)
replayer
plot(replayer)  
  
# creating 2 clusterers of different algorithms
dsc1 <- DSC_DBSTREAM(r=0.1)
dsc2 <- DSC_DStream(gridsize=0.1, Cm=1.5)
  
# clustering the same data in 2 DSC objects
reset_stream(replayer) # resetting the replayer to the first position
update(dsc1, replayer, 500)
reset_stream(replayer)
update(dsc2, replayer, 500)
  
# plot the resulting clusterings
reset_stream(replayer) 
plot(dsc1, replayer, main="DBSTREAM")
reset_stream(replayer) 
plot(dsc2, replayer, main="D-Stream")   
  
### use a data.frame to create a stream (3rd col. contains the assignment)
df <- data.frame(x=runif(100), y=runif(100), 
  class=sample(1:3, 100, replace=TRUE))
head(df)  

stream <- DSD_Memory(df[,c("x", "y")], class=df[,"class"])  
stream



