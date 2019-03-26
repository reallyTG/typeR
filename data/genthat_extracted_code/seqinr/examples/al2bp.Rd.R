library(seqinr)


### Name: al2bp
### Title: To Convert a forensic microsatellite allele name into its length
###   in base pairs
### Aliases: al2bp

### ** Examples

#
#   Quality check and examples:
#
stopifnot( al2bp("9") == 36 )   # 9 repeats of a tetranucleotide is 36 bp
stopifnot( al2bp(9) == 36 )      # also OK with numerical argument
stopifnot( al2bp(9, 5) == 45 )  # 9 repeats of a pentanucleotide is 45 bp
stopifnot( al2bp("9.3") == 39 ) # microvariant case
stopifnot( is.na(al2bp("<8")) )   # off ladder case 
stopifnot( is.na(al2bp(">19")) ) # off ladder case
stopifnot( is.na(al2bp("X")) )     # non STR case
#
# Application to the alleles names in the identifiler data set where all loci are 
# tetranucleotide repeats:
#
data(identifiler)
al.names <- unlist(identifiler)
al.length <- sapply(al.names, al2bp)
loc.names <- unlist(lapply(identifiler, names))
loc.nall  <-unlist(lapply(identifiler, function(x) lapply(x,length)))
loc.fac <- factor(rep(loc.names, loc.nall))
par(lend = "butt", mar = c(5,6,4,1)+0.1)
boxplot(al.length~loc.fac, las = 1, col = "lightblue",
  horizontal = TRUE, main = "Range of allele lengths at forensic loci",
  xlab = "Length (bp)", ylim = c(0, max(al.length, na.rm = TRUE)))



