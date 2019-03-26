library(geozoning)


### Name: ptNei
### Title: returns list of point neigbors for each point
### Aliases: ptNei

### ** Examples

## No test: 
data(mapTest) # simulated data
grid=genEmptyGrid(calStep(2000,1,1),1,1)
nbP= grid$nx*grid$ny
neighBool=matrix(logical(nbP^2),nbP,nbP)
resVoronoi=voronoiPolygons(mapTest$krigData,c(0,1,0,1),neighBool)
neighBool=resVoronoi$neighBool
listeNpt=ptNei(neighBool)
## End(No test)



