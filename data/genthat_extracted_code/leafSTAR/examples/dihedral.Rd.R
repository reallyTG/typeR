library(leafSTAR)


### Name: dihedral
### Title: Calculate the dihedral angle between two planes
### Aliases: dihedral

### ** Examples

## No test: 
data(orchids)
  pseudobulbs<-subset(orchids,organ=="pseudobulb") #subset
  leaves<-subset(orchids,organ=="leaf")
  dihedral(plane1=pseudobulbs,plane2=leaves,Ahmes=FALSE,ID=NULL,pitch1=pseudobulbs$pitch,
  roll1=pseudobulbs$roll,course1=pseudobulbs$course,pitch2=leaves$pitch,roll2=leaves$roll,
  course2=leaves$course,horiz=FALSE)
## End(No test)  
#dihedral()



