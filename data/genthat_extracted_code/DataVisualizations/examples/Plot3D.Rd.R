library(DataVisualizations)


### Name: Plot3D
### Title: 3D plot of points
### Aliases: Plot3D
### Keywords: plot3 plot3d plot3D zplot

### ** Examples

#Spin3D similar output
data(Lsun3D)
Plot3D(Lsun3D$Data,Lsun3D$Cls,type='s',radius=0.1,box=FALSE,aspect=TRUE)
## No test: 
rgl::grid3d(c("x", "y", "z"))
## End(No test)

#Projected Points with Classification
Data=cbind(runif(500,min=-3,max=3),rnorm(500))

# Classification
Cls=ifelse(Data[,1]>0,1,2)
Plot3D(Data,Cls,UniqueColors = DataVisualizations::DefaultColorSequence[c(1,3)],size=2)

## No test: 
#Points with Non-Overlapping Labels
#require(ggrepel)
Data=cbind(runif(30,min=-1,max=1),rnorm(30,0,0.5))
Names=paste0('VeryLongName',1:30)
ggobj=Plot3D(Data)
ggobj +  geom_text_repel(aes(label=Names), size=3)
## End(No test)



