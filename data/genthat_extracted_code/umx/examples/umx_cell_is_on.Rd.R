library(umx)


### Name: umx_cell_is_on
### Title: Return whether a cell is in a set location of a matrix
### Aliases: umx_cell_is_on

### ** Examples

umx_cell_is_on(r = 3, c = 3, "lower")
umx_cell_is_on(r = 3, c = 3, "upper")
umx_cell_is_on(r = 3, c = 3, "diag")
umx_cell_is_on(r = 2, c = 3, "diag")
umx_cell_is_on(r = 3, c = 3, "any")
a_cp = umxMatrix("a_cp", "Lower", 3, 3, free = TRUE, values = 1:6)
umx_cell_is_on(r = 3, c = 3, "left", mat = a_cp)
## Not run: 
##D # test stopping
##D umx_cell_is_on(r=4,c = 3, "any", mat = a_cp)
## End(Not run)



