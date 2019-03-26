library(networkDynamicData)


### Name: onlineNet
### Title: UCI Facebook-like Social Network
### Aliases: onlineNet onlineNetwork
### Keywords: datasets

### ** Examples

data(onlineNetwork)

# convert timestamp to human-readable
as.POSIXct(1080101515,origin = "1970-01-01")

# plot number in network over time
plot(sapply(seq(from=1080101515, to=1098777142,length.out=100),
      function(t){
        network.size.active(onlineNet,at=t)
       }
       ),ylab= '# members'
)




