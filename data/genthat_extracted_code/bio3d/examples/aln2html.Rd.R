library(bio3d)


### Name: aln2html
### Title: Create a HTML Page For a Given Alignment
### Aliases: aln2html
### Keywords: IO

### ** Examples

## Not run: 
##D ## Read an example alignment
##D aln <- read.fasta(system.file("examples/hivp_xray.fa",package="bio3d"))
##D 
##D ## Produce a HTML file for this alignment
##D aln2html(aln, append=FALSE, file=file.path("eg.html"))
##D aln2html(aln, colorscheme="ent", file="eg.html")
##D ## View/open the file in your web browser
##D #browseURL("eg.html")
## End(Not run)



