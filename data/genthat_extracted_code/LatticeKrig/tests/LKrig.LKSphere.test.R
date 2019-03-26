suppressMessages( library( LatticeKrig))

#options( echo =FALSE)


Rmax<-7
MultiGrid<- IcosohedronGrid(Rmax)
delta<- 1.408/ 2^( 0:(Rmax-1) )
dtype<- "GreatCircle"
attributes(dtype)<- list( Radius=1.0)

# testing whether nearest neighbor rule is correct. 
for( k in 1: Rmax){
  grid3d<- MultiGrid[[ k]]
  grid<- toSphere( grid3d )
  B = LKDist(  grid[,1:2], grid[,1:2], delta = delta[k],
               distance.type= dtype)
  hold<- as.numeric( table ( B$ind[,1]) ) 
  N<- length( hold)
  test.for.zero( sum( hold==6), 12)
  if( N > 12){
  test.for.zero( sum( hold==7), N-12)
  }
}

