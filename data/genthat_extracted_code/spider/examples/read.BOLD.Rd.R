library(spider)


### Name: read.BOLD
### Title: Downloads DNA sequences from the Barcode of Life Database (BOLD)
### Aliases: read.BOLD
### Keywords: Barcoding Datasets

### ** Examples


## Not run: 
##D stats.BOLD("Pisauridae")
##D 
##D search.BOLD(c("Danio kyathit", "Dolomedes", "Sitona discoideus"))
##D 
##D nn <- search.BOLD("Pisauridae")
##D pisaurid <- read.BOLD(nn)
##D 
##D ape::write.dna(pisaurid, "filename.fas", format="fasta")
## End(Not run)




