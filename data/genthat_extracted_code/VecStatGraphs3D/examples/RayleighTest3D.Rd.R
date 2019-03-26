library(VecStatGraphs3D)


### Name: RayleighTest3D
### Title: Rayleigh Test. Formal test of uniformity.
### Aliases: RayleighTest3D
### Keywords: test

### ** Examples

   FileName<-system.file("data/XYZcoor.txt", package="VecStatGraphs3D")
   dat<-LoadData3D(FileName, Type=1)
   coordinates<-dat[,4:6]
   RayleighTest3D(coordinates, Alpha = 0.05)



