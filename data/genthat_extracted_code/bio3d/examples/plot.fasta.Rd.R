library(bio3d)


### Name: plot.fasta
### Title: Plot a Multiple Sequence Alignment
### Aliases: plot.fasta
### Keywords: hplot

### ** Examples

# Read alignment
aln <- read.fasta(system.file("examples/kif1a.fa",package="bio3d"))

## alignment plot
plot(aln, labels=basename.pdb(aln$id))

## Works also for a 'pdbs' object
attach(transducin)
plot(pdbs)

detach(transducin)

## Not run: 
##D infile <- "http://pfam.xfam.org/family/PF00071/alignment/seed/format?format=fasta"
##D aln <- read.fasta( infile )
##D plot(aln)
## End(Not run)



