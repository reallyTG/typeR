library(MPDiR)


### Name: CorticalCells
### Title: Contrast Response Functions from Visual Cortical Cells
### Aliases: CorticalCells
### Keywords: datasets

### ** Examples

data(CorticalCells)
lattice::xyplot(Response ~ Contrast | Cell, CorticalCells, 
	type = "b")



