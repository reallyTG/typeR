library(Hapi)


### Name: hapiIdentifyCV
### Title: Indentify crossovers in gamete cells
### Aliases: hapiIdentifyCV

### ** Examples

ref <- sample(c('A','T'),500, replace=TRUE)
alt <- sample(c('C','G'),500, replace=TRUE)

hap <- data.frame(hap1=ref, hap2=alt, stringsAsFactors = FALSE)
rownames(hap) <- seq_len(500)

gmt <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
    gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
    stringsAsFactors = FALSE)
    
cvOutput <- hapiIdentifyCV(hap=hap, gmt=gmt)



