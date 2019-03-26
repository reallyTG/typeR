library(protr)


### Name: extractPSSMAcc
### Title: Profile-based protein representation derived by PSSM
###   (Position-Specific Scoring Matrix) and auto cross covariance
### Aliases: extractPSSMAcc
### Keywords: Alignment Blast PSSM extract

### ** Examples

if (Sys.which("makeblastdb") == "" | Sys.which("psiblast") == "") {

  cat("Cannot find makeblastdb or psiblast. Please install NCBI Blast+")

} else {

  x = readFASTA(system.file(
    "protseq/P00750.fasta", package = "protr"))[[1]]
  dbpath = tempfile("tempdb", fileext = ".fasta")
  invisible(file.copy(from = system.file(
    "protseq/Plasminogen.fasta", package = "protr"), to = dbpath))

  pssmmat = extractPSSM(seq = x, database.path = dbpath)
  pssmacc = extractPSSMAcc(pssmmat, lag = 3)
  tail(pssmacc)

}



