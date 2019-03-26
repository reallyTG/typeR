library(BoSSA)


### Name: refpkg
### Title: Summary data and plots for reference packages
### Aliases: refpkg

### ** Examples


refpkg_path <- paste(find.package("BoSSA"),"/extdata/example.refpkg",sep="")

### summary
refpkg(refpkg_path)

### taxonomy
taxonomy <- refpkg(refpkg_path,type="taxonomy")
head(taxonomy)

### info
refpkg(refpkg_path,type="info")

### tree
refpkg(refpkg_path,type="tree",rank_tree="order",cex.text=0.5)

### pie
refpkg(refpkg_path,type="pie",rank_pie=c("class","order","family"),cex.text=0.6)

### krona
# it will produce a flat text file
# this file can be use as input for the the "ImportText.pl" krona script
# see https://github.com/marbl/Krona/wiki/KronaTools for more details on krona
refpkg(refpkg_path,type="krona",out_krona="for_krona.txt")




