library(shp2graph)


### Name: points2network
### Title: Integrate a point data set into a network
### Aliases: points2network Nearest.nodes footpoint.nodes Add.nodes
###   virtualedge.nn point.in.bbox
### Keywords: spatial, graph

### ** Examples

## Not run: 
##D data(ORN)
##D pts<-spsample(ORN.nt, 100, type="random")
##D ptsxy<-coordinates(pts)[,1:2]
##D ptsxy<-cbind(ptsxy[,1]+0.008,ptsxy[,2]+0.008)
##D #Mapping each point to the nearest node in the network/graph
##D res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, approach=1)
##D ptsinnt.view(ntdata=rn, nodelist=res[[1]], pointsxy=ptsxy,
##D              CoorespondIDs=res[[3]])
##D #Mapping each point to the nearest point (add them as nodes if they are not) on 
##D #the network
##D res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, approach=2,ea.prop=rep(0,37))
##D ptsinnt.view(ntdata=ORN.nt, nodelist=res[[1]], pointsxy=ptsxy, CoorespondIDs=res[[3]]) 
##D #Add a new edge(Virtual edge) between each point and the nearest node
##D res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, approach=3,ea.prop=rep(0,37))
##D VElist<-res[[7]]
##D ptsinnt.view(ntdata=ORN.nt, nodelist=res[[1]], pointsxy=ptsxy, CoorespondIDs=res[[3]], 
##D              VElist=VElist)
##D #Add a new edge(Virtual edge) between each point and the nearest point
##D res<-points2network(ntdata=ORN.nt,pointsxy=ptsxy, approach=4,ea.prop=rep(0,37))
##D VElist<-res[[7]]
##D ptsinnt.view(ntdata=ORN.nt, nodelist=res[[1]], pointsxy=ptsxy, CoorespondIDs=res[[3]],
##D              VElist=VElist) 
## End(Not run)



