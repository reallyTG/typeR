library(RAM)


### Name: seq_var
### Title: Plot Intra And Inter Specific Variation For An Alignment
### Aliases: seq_var
### Keywords: models

### ** Examples

data(alignment)
## Not run: 
##D seq_var(taxon="Claviceps", region="ITS", align=alignment,
##D         file.align=NULL, outgroup.name=c("Talaromyces"),
##D         box.cex.axis.text.x=6, box.cex.axis.text.y=6, 
##D         box.cex.xlab=8, box.cex.ylab=8, intra.fill="purple", 
##D         inter.fill="orange", den.cex.axis.text.x=6, 
##D         den.cex.axis.text.y=6, den.cex.xlab=6, den.cex.ylab=6, 
##D         table.cex=8, frame.col="blue", main=TRUE, main.cex=14)
##D seq_var(taxon="Claviceps", region="ITS", align=NULL,
##D         file.align="/path/to/alignment_file", 
##D         outgroup.name=c("Talaromyces"), box.cex.axis.text.x=6, 
##D         box.cex.axis.text.y=6, box.cex.xlab=8,
##D         box.cex.ylab=8, intra.fill="purple", 
##D         inter.fill="orange", den.cex.axis.text.x=6, 
##D         den.cex.axis.text.y=6, den.cex.xlab=6, den.cex.ylab=6, 
##D         table.cex=8, frame.col="blue", main=TRUE, main.cex=14)
## End(Not run)



