library(DataVisualizations)


### Name: Silhouetteplot
### Title: Silhouette plot of classified data.
### Aliases: Silhouetteplot
### Keywords: Silhouettes Silhouette Silhouette plot

### ** Examples

data("Lsun3D")
Cls=Lsun3D$Cls
Data=Lsun3D$Data
#clear cluster structure
plot(Data[,1:2],col=Cls)
#However, the silhouette plot does not indicate a very good clustering in cluster 1 and 2
Silhouetteplot(Data,Cls = Cls,main='Silhouetteplot')




