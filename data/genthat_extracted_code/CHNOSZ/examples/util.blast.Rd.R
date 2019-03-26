library(CHNOSZ)


### Name: util.blast
### Title: Functions to Work with BLAST Output Files
### Aliases: util.blast read.blast id.blast write.blast def2gi

### ** Examples

## using def2gi
def <- "gi|218295810|ref|ZP_03496590.1|"
stopifnot(all.equal(def2gi(def), "218295810"))

## process some of the BLAST output for proteins
## from Bison Pool metagenome (JGI, 2007)
# read the file that connects taxids with the sequence identifier
tfile <- system.file("extdata/bison/gi.taxid.txt.xz", package="CHNOSZ")
gi.taxid <- scan(tfile, what=as.list(character(2)), flush=TRUE)
# read the file that connects names with the taxids
nfile <- system.file("extdata/refseq/taxid_names.csv.xz", package="CHNOSZ")
taxid.names <- read.csv(nfile)
# the BLAST files
sites <- c("N","S","R","Q","P")
bfile <- paste("extdata/bison/bison", sites, "_vs_refseq57.blastp.xz", sep="")
for(i in 1:5) {
  file <- system.file(bfile[i], package="CHNOSZ")
  # read the blast file, with default filtering settings
  bl <- read.blast(file)
  # process the blast file -- get taxon names
  ib <- id.blast(bl, gi.taxid, taxid.names, min.taxon=2^-7)
  # count each of the phyla
  bd <- as.matrix(sapply(unique(ib$phylum), function(x) (sum(x==ib$phylum))))
  colnames(bd) <- sites[i]
  # make a matrix -- each column for a different file
  if(i==1) bardata <- bd else {
    bardata <- merge(bardata, bd, all=TRUE, by="row.names")
    rownames(bardata) <- bardata$Row.names
    bardata <- bardata[,-1]
  }
}
# normalize the counts
bardata[is.na(bardata)] <- 0
bardata <- t(t(bardata)/colSums(bardata))
# make a bar chart
bp <- barplot(as.matrix(bardata), col=rainbow(nrow(bardata)),
  xlab="location", ylab="fractional abundance")
# add labels to the bars
names <- substr(row.names(bardata), 1, 3)
for(i in 1:5) {
  bd <- bardata[,i]
  ib <- bd!=0
  y <- (cumsum(bd) - bd/2)[ib]
  text(bp[i], y, names[ib])
}
title(main=paste("Phylum Classification of Protein Sequences",
  "in Part of the Bison Pool Metagenome", sep="\n"))



