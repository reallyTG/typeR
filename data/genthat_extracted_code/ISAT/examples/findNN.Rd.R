library(ISAT)


### Name: findNN
### Title: Find the nearest neighbour (NN) given a cell and a group of
###   cells;
### Aliases: findNN

### ** Examples

Cell.X.Position=sample (1:100,1)
Cell.Y.Position=sample (1:100,1)
Tcell=data.frame(Cell.X.Position,Cell.Y.Position)
Cell.X.Position=sample(1:500,5,replace=TRUE)
Cell.Y.Position=sample(1:500,5,replace=TRUE)
Tumor.cells=data.frame(Cell.X.Position,Cell.Y.Position)
findNN(Tcell,Tumor.cells,XY_LABELS=c('Cell.X.Position', 'Cell.Y.Position'))



