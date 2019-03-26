library(bios2mds)


### Name: export.fasta
### Title: Writes a MSA file in FASTA format
### Aliases: export.fasta
### Keywords: export,fasta

### ** Examples

# reading of the multiple sequence alignment of human GPCRS in FASTA format:
aln <- import.fasta(system.file("msa/human_gpcr.fa", package = "bios2mds"))
export.fasta(aln)



