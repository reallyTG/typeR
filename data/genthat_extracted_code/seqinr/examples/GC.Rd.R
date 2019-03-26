library(seqinr)


### Name: G+C Content
### Title: Calculates the fractional G+C content of nucleic acid sequences.
### Aliases: GC GC1 GC2 GC3 GCpos
### Keywords: manip

### ** Examples

   mysequence <- s2c("agtctggggggccccttttaagtagatagatagctagtcgta")
   GC(mysequence)  # 0.4761905
   GC1(mysequence) # 0.6428571
   GC2(mysequence) # 0.3571429
   GC3(mysequence) # 0.4285714
#
# With upper-case characters:
#
  myUCsequence <- s2c("GGGGGGGGGA")
  GC(myUCsequence) # 0.9
#
# With ambiguous bases:
#
  GC(s2c("acgt")) # 0.5
  GC(s2c("acgtssss")) # 0.5
  GC(s2c("acgtssss"), exact = TRUE) # 0.75
#
# Missing data:
#
  stopifnot(is.na(GC(s2c("NNNN"))))
  stopifnot(is.na(GC(s2c("NNNN"), exact = TRUE)))
  stopifnot(is.na(GC(s2c("WWSS"))))
  stopifnot(GC(s2c("WWSS"), exact = TRUE) == 0.5)
#
# Coding sequences tests:
#
  cdstest <- s2c("ATGATG")
  stopifnot(GC3(cdstest) == 1)
  stopifnot(GC2(cdstest) == 0)
  stopifnot(GC1(cdstest) == 0)
#
# How to reproduce the results obtained with the C program codonW
# version 1.4.4 writen by John Peden. We use here the "input.dat"
# test file from codonW (there are no ambiguous base in these
# sequences).
#
  inputdatfile <- system.file("sequences/input.dat", package = "seqinr")
  input <- read.fasta(file = inputdatfile) # read the FASTA file
  inputoutfile <- system.file("sequences/input.out", package = "seqinr")
  input.res <- read.table(inputoutfile, header = TRUE) # read codonW result file
#
# remove stop codon before computing G+C content (as in codonW)
#
  GC.codonW <- function(dnaseq, ...){
  	 GC(dnaseq[seq_len(length(dnaseq) - 3)], ...)
  }
  input.gc <- sapply(input, GC.codonW, forceToLower = FALSE)
  max(abs(input.gc - input.res$GC)) # 0.0004946237

  plot(x = input.gc, y = input.res$GC, las = 1,
  xlab = "Results with GC()", ylab = "Results from codonW",
  main = "Comparison of G+C content results")
  abline(c(0, 1), col = "red")
  legend("topleft", inset = 0.01, legend = "y = x", lty = 1, col = "red")
## Not run: 
##D # Too long for routine check
##D # This is a benchmark to compare the effect of various parameter
##D # setting on computation time
##D n <- 10
##D from <-10^4
##D to <- 10^5
##D size <- seq(from = from, to = to, length = n)
##D res <- data.frame(matrix(NA, nrow = n, ncol = 5))
##D colnames(res) <- c("size", "FF", "FT", "TF", "TT")
##D res[, "size"] <- size
##D 
##D for(i in seq_len(n)){
##D   myseq <- sample(x = s2c("acgtws"), size = size[i], replace = TRUE)   
##D   res[i, "FF"] <- system.time(GC(myseq, forceToLower = FALSE, exact = FALSE))[3]
##D   res[i, "FT"] <- system.time(GC(myseq, forceToLower = FALSE, exact = TRUE))[3]
##D   	res[i, "TF"] <- system.time(GC(myseq, forceToLower = TRUE, exact = FALSE))[3]
##D   	res[i, "TT"] <- system.time(GC(myseq, forceToLower = TRUE, exact = TRUE))[3]
##D }
##D 
##D par(oma = c(0,0,2.5,0), mar = c(4,5,0,2) + 0.1, mfrow = c(2, 1))
##D plot(res$size, res$TT, las = 1, 
##D xlab = "Sequence size [bp]",
##D ylim = c(0, max(res$TT)), xlim = c(0, max(res$size)), ylab = "")
##D title(ylab = "Observed time [s]", line = 4)
##D abline(lm(res$TT~res$size))
##D points(res$size, res$FT, col = "red")
##D abline(lm(res$FT~res$size), col = "red", lty = 3)
##D points(res$size, res$TF, pch = 2)
##D abline(lm(res$TF~res$size))
##D points(res$size, res$FF, pch = 2, col = "red")
##D abline(lm(res$FF~res$size), lty = 3, col = "red")
##D 
##D 
##D legend("topleft", inset = 0.01,
##D  legend = c("forceToLower = TRUE", "forceToLower = FALSE"),
##D   col = c("black", "red"), lty = c(1,3))
##D legend("bottomright", inset = 0.01, legend = c("exact = TRUE", "exact = FALSE"),
##D pch = c(1,2))
##D 
##D mincpu <- lm(res$FF~res$size)$coef[2]
##D 
##D barplot(
##D c(lm(res$FF~res$size)$coef[2]/mincpu, 
##D   lm(res$TF~res$size)$coef[2]/mincpu,
##D   lm(res$FT~res$size)$coef[2]/mincpu,
##D   lm(res$TT~res$size)$coef[2]/mincpu),
##D horiz = TRUE, xlab = "Increase of CPU time",
##D col = c("red", "black", "red", "black"),
##D names.arg = c("(F,F)", "(T,F)", "(F,T)", "(T,T)"), las = 1)
##D title(ylab = "forceToLower,exact", line = 4)
##D 
##D mtext("CPU time as function of options", outer = TRUE, line = 1, cex = 1.5)
## End(Not run)



