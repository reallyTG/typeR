library(Hapi)


### Name: hapiFrameSelection
### Title: Selection of hetSNPs to form a framework
### Aliases: hapiFrameSelection

### ** Examples

ref <- rep(0,500)
alt <- rep(1,500)

gmt <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)

idx <- sort(sample(seq_len(500), 10, replace = FALSE))

gmt[idx,1] <- NA
gmt[idx,2] <- NA
gmt[idx,3] <- NA

gmtFrame <- hapiFrameSelection(gmt = gmt, n = 3)



