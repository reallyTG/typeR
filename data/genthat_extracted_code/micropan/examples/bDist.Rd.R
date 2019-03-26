library(micropan)


### Name: bDist
### Title: Computes distances between sequences based on BLAST results
### Aliases: bDist

### ** Examples

# Using BLAST result files in this package...
prefix <- c("GID1_vs_GID1.txt",
            "GID1_vs_GID2.txt",
            "GID1_vs_GID3.txt",
            "GID2_vs_GID1.txt",
            "GID2_vs_GID2.txt",
            "GID2_vs_GID3.txt",
            "GID3_vs_GID1.txt",
            "GID3_vs_GID2.txt",
            "GID3_vs_GID3.txt")
xpth <- file.path(path.package("micropan"),"extdata")
blast.files <- file.path(xpth,paste(prefix,".xz",sep=""))

# We need to uncompress them first...
tf <- tempfile(pattern=prefix,fileext=".xz")
s <- file.copy(blast.files,tf)
tf <- unlist(lapply(tf,xzuncompress))

# Computing pairwise distances
blast.distances <- bDist(tf)

# ...and cleaning...
s <- file.remove(tf)

# See also example for blastAllAll




