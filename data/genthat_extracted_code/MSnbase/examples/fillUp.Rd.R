library(MSnbase)


### Name: fillUp
### Title: Fills up a vector
### Aliases: fillUp

### ** Examples

d <- data.frame(protein=c("Prot1","","","Prot2","",""),
                peptide=c("pep11","","pep12","pep21","pep22",""),
                score=c(1:2,NA,1:3))
d
e <- apply(d,2,fillUp)
e
data.frame(e)
fillUp(d[,1])



