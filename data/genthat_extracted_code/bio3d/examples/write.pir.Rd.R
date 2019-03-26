library(bio3d)


### Name: write.pir
### Title: Write PIR Formated Sequences
### Aliases: write.pir
### Keywords: IO

### ** Examples

## No test: 
# Needs MUSCLE installed - testing excluded

if(check.utility("muscle")) {

## Generate an input file for structural modeling of 
## transducin G-alpha subunit using the template 3SN6_A

## Read transducin alpha subunit sequence
seq <- get.seq("P04695", db = "uniprot", outfile = tempfile())

## Read structure template
path = tempdir()
pdb.file <- get.pdb("3sn6_A", path = path, split = TRUE)
pdb <- read.pdb(pdb.file)

## Build an alignment between template and target
aln <- seqaln(seqbind(pdbseq(pdb), seq), id = c("3sn6_A", seq$id), outfile = tempfile())

## Write PIR format alignment file
outfile = file.path(tempdir(), "eg.pir")
write.pir(aln, pdb.file = c(pdb.file, ""), file = outfile)

invisible( cat("\nSee the output file:", outfile, sep = "\n") )

}
## End(No test)



