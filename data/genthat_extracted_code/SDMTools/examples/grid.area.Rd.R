library(SDMTools)


### Name: grid.area
### Title: Create a Grid of Cell Areas or Perimeters
### Aliases: grid.area grid.perimeter

### ** Examples

#Create an ascii file
y=seq(10,50,0.5)
x=seq(140,180,0.5)
cellsize=0.5
data1=sample(160,140)
out1.asc=as.asc(matrix(data1,nc=y, nr=x), xll=min(x), yll=min(y), cellsize=cellsize)

grid.area(out1.asc)[,]

grid.perimeter(out1.asc)[,]



