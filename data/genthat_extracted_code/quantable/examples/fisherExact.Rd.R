library(quantable)


### Name: fisherExact
### Title: get p-values using fishers exact test for count data
### Aliases: fisherExact

### ** Examples

accessions <- letters
x <- sample(100,length(letters))
y <- sample(100,length(letters))
res <- fisherExact(x,y,accessions)
volcanoplot(res$fchange, res$pvaladj, labels = res$accessions)




