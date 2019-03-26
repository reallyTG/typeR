library(RSDA)


### Name: sym.scatterplot3d
### Title: Symbolic Scatter Plot 3D
### Aliases: sym.scatterplot3d
### Keywords: 3DPlot Symbolic

### ** Examples

data(lynne1)
class(lynne1) <- c('sym.data.table')
sym.scatterplot3d(lynne1[,1], lynne1[,2], lynne1[,3],
                 color='blue', main='Lynne Data')



