library(seqinr)


### Name: draw.oriloc
### Title: Graphical representation for nucleotide skews in prokaryotic
###   chromosomes.
### Aliases: draw.oriloc
### Keywords: hplot

### ** Examples

## Not run: 
##D  # need internet connection
##D #
##D # Example with Chlamydia trachomatis complete genome
##D #
##D   ori <- oriloc()
##D   draw.oriloc(ori)
##D #
##D # The same, using more options from function draw.oriloc()
##D #
##D draw.oriloc(ori, 
##D   main = expression(italic(Chlamydia~~trachomatis)~~complete~~genome),
##D   ta.mtext = "TA skew", ta.col = "red",
##D   cg.mtext = "CG skew", cg.col = "blue",
##D   cds.mtext = "CDS skew", cds.col = "seagreen",
##D   add.grid = FALSE)
## End(Not run)



