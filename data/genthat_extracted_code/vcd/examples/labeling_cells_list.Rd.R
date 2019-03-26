library(vcd)


### Name: labeling_cells_list
### Title: Labeling Functions for Strucplots
### Aliases: labeling_list labeling_cells
### Keywords: hplot

### ** Examples

data("Titanic")

mosaic(Titanic, labeling = labeling_cells)
mosaic(Titanic, labeling = labeling_list)

## A more complex example, adding the observed frequencies
## to a mosaic plot:
tab <- ifelse(Titanic < 6, NA, Titanic)
mosaic(Titanic, pop = FALSE)
labeling_cells(text = tab, margin = 0)(Titanic)



