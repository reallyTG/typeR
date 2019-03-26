library(insol)


### Name: GCdistance
### Title: Great circle distance
### Aliases: GCdistance

### ** Examples

GCdistance(0,0,0,180)*2

# distance between the center of US states 
data(state)
ddd = matrix(nrow=50,ncol=50,dimnames=list(state.name,state.name))
for (i in 1:50){
	for (j in 1:50){
		distij = GCdistance(state.center$y[i],state.center$x[i],
			state.center$y[j],state.center$x[j])
		# round to miles
		ddd[i,j]=round(distij/1609.344,2)
	}
}
# format and print results for the 10 firsts states
as.dist(ddd[1:10,1:10])





