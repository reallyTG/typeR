library(seqinr)


### Name: count
### Title: Composition of dimer/trimer/etc oligomers
### Aliases: count
### Keywords: manip

### ** Examples

a <- s2c("acgggtacggtcccatcgaa")
##
## To count dinucleotide occurrences in sequence a:
##
count(a, word = 2)
##
## To count trinucleotide occurrences in sequence a, with start = 2:
##
count(a, word = 3, start = 2)
##
## To count dinucleotide relative frequencies in sequence a:
##
count(a, word = 2, freq = TRUE)
##
## To count dinucleotides in codon positions III-I in a coding sequence:
##
alldinuclIIIpI <- s2c("NNaaNatNttNtgNgtNtcNctNtaNagNggNgcNcgNgaNacNccNcaNN")
resIIIpI <- count(alldinuclIIIpI, word = 2, start = 2, by = 3)
stopifnot(all( resIIIpI == 1))
##
## Simple sanity check:
##
#alldinucl <- "aattgtctaggcgacca"
#stopifnot(all(count(s2c(alldinucl), 2) == 1))
#alldiaa <- "aaxxzxbxvxyxwxtxsxpxfxmxkxlxixhxgxexqxcxdxnxrxazzbzvzyzwztzszpzfzmzkzlzizhzgzezqzczdznz
#rzabbvbybwbtbsbpbfbmbkblbibhbgbebqbcbdbnbrbavvyvwvtvsvpvfvmvkvlvivhvgvevqvcvdvnvrvayywytysypyfymyky
#lyiyhygyeyqycydynyryawwtwswpwfwmwkwlwiwhwgwewqwcwdwnwrwattstptftmtktltithtgtetqtctdtntrtasspsfsmsks
#lsishsgsesqscsdsnsrsappfpmpkplpiphpgpepqpcpdpnprpaffmfkflfifhfgfefqfcfdfnfrfammkmlmimhmgmemqmcmdmnm
#rmakklkikhkgkekqkckdknkrkallilhlglelqlcldlnlrlaiihigieiqicidiniriahhghehqhchdhnhrhaggegqgcgdgngrgae
#eqecedenereaqqcqdqnqrqaccdcncrcaddndrdannrnarra"
#stopifnot(all(count(s2c(alldiaa), 2, alphabet = s2c("arndcqeghilkmfpstwyvbzx")) == 1))
##
## Example with dinucleotide count in the complete Human mitochondrion genome:
##
humanMito <- read.fasta(file = system.file("sequences/humanMito.fasta", package = "seqinr"))
##
## Get the dinucleotide count:
##
dinu <- count(humanMito[[1]], 2)
##
## Put the results in a 4 X 4 array:
##
dinu2 <- dinu
dim(dinu2) <- c(4, 4)
nucl <- s2c("ACGT")
dimnames(dinu2) <- list(paste(nucl, "-3\'", sep = ""), paste("5\'-", nucl, sep = ""))
##
## Show that CpG and GpT dinucleotides are depleted:
##
mosaicplot(t(dinu2), shade = TRUE,
  main = "Dinucleotide XpY frequencies in the Human\nmitochondrion complete genome", 
  xlab = "First nucleotide: Xp", 
  ylab = "Second nucleotide: pY", las = 1, cex = 1)
mtext("Note the depletion in CpG and GpT dinucleotides", side = 1, line = 3)



