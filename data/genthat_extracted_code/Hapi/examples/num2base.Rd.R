library(Hapi)


### Name: num2base
### Title: Convert genotype coded in 0/1 to A/T/C/G
### Aliases: num2base

### ** Examples

ref <- sample(c('A','T'),500, replace=TRUE)
alt <- sample(c('C','G'),500, replace=TRUE)

consensusHap <- data.frame(hap1=rep(0,500),hap2=rep(1,500),
    total=rep(5,500),rate=rep(1,500),
    confidence=rep('F',500),
    stringsAsFactors = FALSE)
rownames(consensusHap) <- seq_len(500)

hap <- num2base(hap=consensusHap, ref=ref, alt=alt)



