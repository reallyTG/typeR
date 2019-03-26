library(gaston)


### Name: LD.plot
### Title: Plot Linkage Disequilibrium
### Aliases: LD.plot
### Keywords: Linkage Disequilibrium

### ** Examples

# Load data
data(AGT)
x <- as.bed.matrix(AGT.gen, AGT.fam, AGT.bim)

# Compute LD
ld.x <- LD(x, c(1,ncol(x)))

# Plot a tiny part of the LD matrix
LD.plot( ld.x[1:20,1:20], snp.positions = x@snps$pos[1:20] )

# Customize the plot
LD.plot( ld.x[1:20,1:20], snp.positions = x@snps$pos[1:20], 
         graphical.par = list(cex = 1.3, bg = "gray"), 
         polygon.par = list(border = NA), write.ld = NULL )
## Not run: 
##D # Plotting the whole matrix in X11 display is very long (lots of polygons)
##D # but it is ok with a pdf file
##D # (please uncomment to run)
##D #LD.plot(ld.x, snp.positions = x@snps$pos, max.dist = 50e3, write.ld = NULL, pdf.file = "LDAGT.pdf")
## End(Not run)



