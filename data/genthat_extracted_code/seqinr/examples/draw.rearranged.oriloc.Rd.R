library(seqinr)


### Name: draw.rearranged.oriloc
### Title: Graphical representation for rearranged nucleotide skews in
###   prokaryotic chromosomes.
### Aliases: draw.rearranged.oriloc

### ** Examples


## Not run: 
##D ### Example for Chlamydia trachomatis ####
##D 
##D ### Rearrange the chromosome and compute the nucleotide skews ###
##D 
##D #r.ori <- rearranged.oriloc(seq.fasta = system.file("sequences/ct.fasta.gz", package = "seqinr"),
##D #    g2.coord = system.file("sequences/ct.coord", package = "seqinr"))
##D 
##D r.ori <- rearranged.oriloc(seq.fasta = system.file("sequences/ct.fasta.gz", package = "seqinr"),
##D     g2.coord = system.file("sequences/ct.coord", package = "seqinr"))
##D 
##D 
##D 
##D ### Extract the breakpoints for the rearranged nucleotide skews ###
##D 
##D breaks <- extract.breakpoints(r.ori, type = c("gcfw", "gcrev"),
##D  nbreaks = c(2, 2), gridsize = 50, it.max = 100)
##D 
##D ### Draw the rearranged nucleotide skews and  ###
##D ### place the position of the breakpoints on the graphics ###
##D 
##D draw.rearranged.oriloc(r.ori, breaks.gcfw = breaks$gcfw$breaks,
##D  breaks.gcrev = breaks$gcrev$breaks)
## End(Not run)



