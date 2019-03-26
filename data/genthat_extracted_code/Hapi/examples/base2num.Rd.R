library(Hapi)


### Name: base2num
### Title: Convert genotype coded in A/T/C/G to 0/1
### Aliases: base2num

### ** Examples

ref <- sample(c('A','T'),500, replace=TRUE)
alt <- sample(c('C','G'),500, replace=TRUE)

gmt <- data.frame(chr=rep(1,500), pos=seq_len(500),
    ref=ref, alt=alt, gmt1=ref, gmt2=alt, gmt3=ref,
    gmt4=ref, gmt5=c(alt[1:250], ref[251:500]),
    stringsAsFactors = FALSE)
    
gmtDa <- base2num(gmt=gmt[5:9], ref=ref, alt=alt)



