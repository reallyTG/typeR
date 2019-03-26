library(fda.usc)


### Name: Depth for a multivariate dataset
### Title: Provides the depth measure for multivariate data
### Aliases: Depth.Multivariate mdepth.HS mdepth.MhD mdepth.SD mdepth.LD
###   mdepth.TD mdepth.RP
### Keywords: descriptive

### ** Examples

data(iris)
group<-iris[,5]
x<-iris[,1:2]
                                  
MhD<-mdepth.MhD(x)
PD<-mdepth.RP(x)
HD<-mdepth.HS(x)
SD<-mdepth.SD(x)

x.setosa<-x[group=="setosa",]
x.versicolor<-x[group=="versicolor",] 
x.virginica<-x[group=="virginica",]
d1<-mdepth.SD(x,x.setosa)$dep
d2<-mdepth.SD(x,x.versicolor)$dep
d3<-mdepth.SD(x,x.virginica)$dep





