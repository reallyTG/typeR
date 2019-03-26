library(Hapi)


### Name: hapiAssembleEnd
### Title: Assembly of haplotypes in regions at the end of a chromosome
### Aliases: hapiAssembleEnd

### ** Examples

finalDraft <- rep(0,500)
names(finalDraft) <- seq_len(500)

ref <- rep(0,500)
alt <- rep(1,500)

gmtDa <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
stringsAsFactors = FALSE)

idx1 <- sort(sample(seq_len(500), 30, replace = FALSE))
idx2 <- sort(sample(seq_len(500), 30, replace = FALSE))
idx3 <- sort(sample(seq_len(500), 30, replace = FALSE))

gmtDa[idx1,1] <- NA
gmtDa[idx2,2] <- NA
gmtDa[idx3,3] <- NA

consensusHap <- data.frame(hap1=rep(0,500),hap2=rep(1,500),
total=rep(5,500),rate=rep(1,500),
confidence=rep('F',500),
stringsAsFactors = FALSE)
rownames(consensusHap) <- seq_len(500)

consensusHap <- hapiAssembleEnd(gmt = gmtDa, draftHap = finalDraft, 
consensusHap = consensusHap, k = 300)



