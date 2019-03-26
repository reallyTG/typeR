library(Hapi)


### Name: hapiFilterError
### Title: Filter out hetSNPs with potential genotyping errors
### Aliases: hapiFilterError

### ** Examples

ref <- rep(0,500)
alt <- rep(1,500)

gmt <- data.frame(gmt1=ref, gmt2=alt, gmt3=ref,
    gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
    stringsAsFactors = FALSE)
    
idx <- sort(sample(seq_len(500), 10, replace = FALSE))
gmt[idx,1] <- 1

gmtDa <- hapiFilterError(gmt = gmt)



