library(ape)


### Name: updateLabel
### Title: Update Labels
### Aliases: updateLabel updateLabel.DNAbin updateLabel.AAbin
###   updateLabel.character updateLabel.phylo updateLabel.evonet
###   updateLabel.data.frame updateLabel.matrix
### Keywords: manip

### ** Examples

## Not run: 
##D ## the tree by Nyakatura & Bininda-Emonds (2012, BMC Biology)
##D x <- "https://static-content.springer.com/esm/art"
##D y <- "3A10.1186"
##D z <- "2F1741-7007-10-12/MediaObjects/12915_2011_534_MOESM5_ESM.NEX"
##D ## The commande below may not print correctly in HTML because of the
##D ## percentage symbol; see the text or PDF help page.
##D url <- paste(x, y, z, sep = "##D 
##D TC <- read.nexus(url)
##D tr <- TC$carnivoreST_bestEstimate
##D old <- c("Uncia_uncia", "Felis_manul", "Leopardus_jacobitus")
##D new <- c("Panthera_uncia", "Otocolobus_manul", "Leopardus_jacobita")
##D tr.updated <- updateLabel(tr, old, new)
## End(Not run)

tr <- rtree(6)
## the order of the labels are randomized by this function
old <- paste0("t", 1:6)
new <- paste0("x", 1:6)
updateLabel(tr, old, new)
tr



