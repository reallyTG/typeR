library(seqinr)


### Name: consensus
### Title: Consensus and profiles for sequence alignments
### Aliases: consensus con

### ** Examples

#
# Read 5 aligned DNA sequences at 42 sites:
#
  phylip <- read.alignment(file = system.file("sequences/test.phylip", 
    package = "seqinr"), format = "phylip")
#
# Show data in a matrix form:
#
  (matali <- as.matrix(phylip))
#
# With the majority rule:
#
  res <- consensus(phylip)
  stopifnot(c2s(res) == "aaaccctggccgttcagggtaaaccgtggccgggcagggtat")
#
# With a threshold:
#
  res.thr <- consensus(phylip, method = "threshold")
  res.thr[is.na(res.thr)] <- "." # change NA into dots
# stopifnot(c2s(res.thr) == "aa.c..t.gc.gtt..g..t.a.cc..ggccg.......ta.")
  stopifnot(c2s(res.thr) == "aa.cc.tggccgttcagggtaaacc.tggccgg.cagggtat")
#
# With an IUPAC summary:
#
  res.iup <- consensus(phylip, method = "IUPAC")
  stopifnot(c2s(res.iup) == "amvsbnkkgcmkkkmmgsktrmrssndkgcmrkdmmvskyaw")
  # replace 3 and 4-fold symbols by dots:
  res.iup[match(res.iup, s2c("bdhvn"), nomatch = 0) > 0] <- "."
  stopifnot(c2s(res.iup) == "am.s..kkgcmkkkmmgsktrmrss..kgcmrk.mm.skyaw")
#
# With a profile method:
#
  (res <- consensus(phylip, method = "profile"))
#
# Show the connection between the profile and some consensus:
#
  bxc <- barplot(res, col = c("green", "blue", "orange", "white", "red"), border = NA,
  space = 0, las = 2, ylab = "Base count",
  main = "Profile of a DNA sequence alignment",
  xlab = "sequence position", xaxs = "i")
  
  text(x = bxc, y = par("usr")[4],lab = res.thr, pos = 3, xpd = NA)
  text(x = bxc, y = par("usr")[1],lab = res.iup, pos = 1, xpd = NA)



