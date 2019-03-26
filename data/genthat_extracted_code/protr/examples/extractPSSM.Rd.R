library(protr)


### Name: extractPSSM
### Title: Compute PSSM (Position-Specific Scoring Matrix) for given
###   protein sequence
### Aliases: extractPSSM
### Keywords: Alignment Blast PSSM extract

### ** Examples

if (Sys.which("makeblastdb") == "" | Sys.which("psiblast") == "") {

  cat("Cannot find makeblastdb or psiblast. Please install NCBI Blast+ first")

} else {

  x = readFASTA(system.file(
    "protseq/P00750.fasta", package = "protr"))[[1]]
  dbpath = tempfile("tempdb", fileext = ".fasta")
  invisible(file.copy(from = system.file(
    "protseq/Plasminogen.fasta", package = "protr"), to = dbpath))

  pssmmat = extractPSSM(seq = x, database.path = dbpath)

  dim(pssmmat)  # 20 x 562 (P00750: length 562, 20 Amino Acids)

}



