library(cubfits)


### Name: Codon Adaptation Index
### Title: Function for Codon Adaptation Index (CAI)
### Aliases: calc_cai_values
### Keywords: tool

### ** Examples

## Not run: 
##D rm(list = ls())
##D library(cubfits, quietly = TRUE)
##D 
##D y <- ex.train$y
##D y.list <- convert.y.to.list(y)
##D CAI <- calc_cai_values(y, y.list)$CAI
##D plot(CAI, log10(ex.train$phi.Obs), main = "Expression vs CAI",
##D      xlab = "CAI", ylab = "Expression (log10)")
##D 
##D ### Verify with the seqinr example.
##D library(seqinr, quietly = TRUE)
##D inputdatfile <- system.file("sequences/input.dat", package = "seqinr")
##D input <- read.fasta(file = inputdatfile, forceDNAtolower = FALSE)
##D names(input)[65] <- paste(names(input)[65], ".1", sep = "") # name duplicated.
##D input <- input[order(names(input))]
##D 
##D ### Convert to cubfits format.
##D seq.string <- convert.seq.data.to.string(input)
##D new.y <- gen.y(seq.string)
##D new.y.list <- convert.y.to.list(new.y)
##D ret <- calc_cai_values(new.y, new.y.list)
##D 
##D ### Rebuild w.
##D w <- rep(1, 64)
##D names(w) <- codon.low2up(rownames(caitab))
##D for(i in 1:64){
##D   id <- which(names(ret$w) == names(w)[i])
##D   if(length(id) == 1){
##D     w[i] <- ret$w[id]
##D   }
##D }
##D CAI.res <- sapply(input, seqinr::cai, w = w)
##D 
##D ### Plot.
##D plot(CAI.res, ret$CAI,
##D      main = "Comparison of seqinR and cubfits results",
##D      xlab = "CAI from seqinR", ylab = "CAI from cubfits", las = 1)
##D abline(c(0, 1))
## End(Not run)



