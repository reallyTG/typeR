library(shp2graph)


### Name: ptsinnt.view
### Title: Visualize the integration between a point data set and spatila
###   network
### Aliases: ptsinnt.view

### ** Examples

data(ORN)
#pts<-spsample(ORN.nt, 100, type="random")
#ptsxy<-coordinates(pts)[,1:2]
#ptsxy<-cbind(ptsxy[,1]+0.008,ptsxy[,2]+0.008)
#Mapping each point to the nearest node in the network/graph
#res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, mapping.method=1)
#Visualize the results without virtual edges 
#ptsinnt.view(ntdata=ORN.nt, nodelist=res[[1]], pointsxy=ptsxy, 
#             CoorespondIDs=res[[3]])
#Visualize the results with virtual edges
#res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, mapping.method=3,
#                    ea.prop=rep(0,37))
#VElist<-res[[7]]
#ptsinnt.view(ntdata=ORN.nt, nodelist=res[[1]], pointsxy=ptsxy, 
#             CoorespondIDs=res[[3]], VElist=VElist)



