library(TmCalculator)


### Name: Tm_GC
### Title: Calculate the melting temperature using empirical formulas based
###   on GC content
### Aliases: Tm_GC

### ** Examples

ambiguous=TRUE
userset=NULL
variant="Primer3Plus"
Na=50
K=0
Tris=0
Mg=0
dNTPs=0
saltcorr=0
mismatch=TRUE
ntseq <- c("ATCGTGCGTAGCAGTACGATCAGTAG")
Tm_GC(ntseq,ambiguous,userset,variant,Na, K,Tris, Mg, dNTPs, saltcorr, mismatch)



