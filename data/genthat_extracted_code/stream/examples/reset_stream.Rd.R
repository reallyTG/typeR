library(stream)


### Name: reset_stream
### Title: Reset a Data Stream to its Beginning
### Aliases: reset_stream

### ** Examples

# initializing the objects
stream <- DSD_Gaussians(k=3, d=2)
replayer <- DSD_Memory(stream, 100)
replayer

p <- get_points(replayer, 50)
replayer

# reset replayer to the begining of the stream
reset_stream(replayer) 
replayer
  
# set replayer to position 21
reset_stream(replayer, pos=21)  
replayer



