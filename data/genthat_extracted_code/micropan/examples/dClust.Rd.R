library(micropan)


### Name: dClust
### Title: Clustering sequences based on domain sequence
### Aliases: dClust

### ** Examples

# Using HMMER3 result files in the micropan package
xpth <- file.path(path.package("micropan"),"extdata")
hmm.files <- file.path(xpth,c("GID1_vs_Pfam-A.hmm.txt.xz",
                              "GID2_vs_Pfam-A.hmm.txt.xz",
                              "GID3_vs_Pfam-A.hmm.txt.xz"))

# We need to uncompress them first...
tf <- tempfile(fileext=rep(".xz",length(hmm.files)))
s <- file.copy(hmm.files,tf)
tf <- unlist(lapply(tf,xzuncompress))

# Reading the HMMER3 results, cleaning overlaps...
hmmer.table <- NULL
for(i in 1:3){
  htab <- readHmmer(tf[i])
  htab <- hmmerCleanOverlap(htab)
  hmmer.table <- rbind(hmmer.table,htab)
}

# The clustering
clustering.domains <- dClust(hmmer.table)

# ...and cleaning...
s <- file.remove(tf)




