library(seqinr)


### Name: rearranged.oriloc
### Title: Detection of replication-associated effects on base composition
###   asymmetry in prokaryotic chromosomes.
### Aliases: rearranged.oriloc
### Keywords: utilities

### ** Examples


### Example for Chlamydia trachomatis ####

### Rearrange the chromosome and compute the nucleotide skews ###

## Not run: 
##D r.ori <- rearranged.oriloc(seq.fasta = 
##D    system.file("sequences/ct.fasta.gz", package = "seqinr"),
##D     g2.coord =  system.file("sequences/ct.predict", package = "seqinr"))
## End(Not run)

### Extract the breakpoints for the rearranged nucleotide skews ###



## Not run: 
##D breaks <- extract.breakpoints(r.ori, type = c("gcfw", "gcrev"), 
##D  nbreaks =c(2, 2), gridsize = 50, it.max = 100)
## End(Not run)



### Draw the rearranged nucleotide skews and place the position of the breakpoints ### 
### on the graphics ###

## Not run: 
##D draw.rearranged.oriloc(r.ori, breaks.gcfw = breaks$gcfw$breaks,
##D  breaks.gcrev = breaks$gcrev$breaks)
## End(Not run)





