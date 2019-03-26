library(rivernet)


### Name: rivernet-package
### Title: Read, Analyse and Plot River Networks
### Aliases: rivernet-package rivernet
### Keywords: package

### ** Examples

coord <- data.frame(Reach_ID=c(1,1,2,2,2,2,2,3,3,4,4),
                    X=c(5,5,5,7,8,9,10,5,0,0,2),
                    Y=c(0,2,2,4,7,6, 8,2,6,6,7),
                    Z=c(0,1,1,2,3,4, 5,1,2,2,3))
attrib.reach <- data.frame(Reach_ID=c(1,2,3,4),
                           State   =c(0,0.2,0.8,0.8),
                           Flow    =c(4,2,2,2))
attrib.node  <- data.frame(X=c(5,5,0,10,2),
                           Y=c(0,2,6, 8,7),
                           Height=c(0,0,1,0,0))
write.table(coord       ,"rivernet_example_coord.csv",sep=";",col.names=TRUE,row.names=FALSE)
write.table(attrib.reach,"rivernet_example_reach.csv",sep=";",col.names=TRUE,row.names=FALSE)
write.table(attrib.node ,"rivernet_example_node.csv" ,sep=";",col.names=TRUE,row.names=FALSE)
net <- rivernet.read("rivernet_example_coord.csv",
                     "rivernet_example_reach.csv",
                     "rivernet_example_node.csv",
                     sep=";")
plot(net,col=ifelse(net$attrib.reach$State<0.5,"red","blue"),lwd=2,
     col.nodes=ifelse(net$attrib.node$Height<0.1,"black","red"),pch=19,cex.nodes=1.5)



