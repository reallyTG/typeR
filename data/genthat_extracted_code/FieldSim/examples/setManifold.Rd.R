library(FieldSim)


### Name: setManifold
### Title: Set a S4 manifold object
### Aliases: setManifold

### ** Examples

# Load FieldSim library
library(FieldSim)

# Example 1: User manifold
name1<-"plane1"
mesh<-seq(from=0,to=1,length=16)
atlas1<-rbind(rep(mesh,each=16),rep(mesh,16))
d1<-function(xi,xj){return(sqrt(t(xi-xj)%*%(xi-xj)))}
origin1<-rbind(0,0)
manifold1<-setManifold(name=name1, atlas=atlas1, distance=d1, origin=origin1)
str(manifold1)

#Example 2: The "line" manifold
line<-setManifold("line")
str(line)

#Example 3: The "plane" manifold
plane<-setManifold("plane")
str(plane)

#Example 4: The "sphere" manifold
sphere<-setManifold("sphere")
str(sphere)

#Example 5: The "hyperboloid" manifold
hyper<-setManifold("hyperboloid")
str(hyper)



