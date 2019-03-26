library(NEArender)


### Name: import.net
### Title: Import a network text file
### Aliases: import.net

### ** Examples

data(net.kegg)
net <- import.net(net.kegg)
summary(net$links)
print(paste(names(net$links)[100], net$links[[100]], sep=": "))




