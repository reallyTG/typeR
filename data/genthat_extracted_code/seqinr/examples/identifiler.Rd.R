library(seqinr)


### Name: identifiler
### Title: Identifiler allele names
### Aliases: identifiler

### ** Examples

data(identifiler)
op <- par(no.readonly = TRUE)
par(mar = c(3,8,4,2)+0.1)
allcount <- unlist(lapply(identifiler, function(x) lapply(x, length)))
barplot(allcount[order(allcount)], horiz = TRUE, las = 1,
main = "Allele count per locus", col = "lightblue")
par(op)



