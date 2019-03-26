library(quanteda)


### Name: format_sparsity
### Title: format a sparsity value for printing
### Aliases: format_sparsity
### Keywords: internal

### ** Examples

s <- c(.9, .99, .999, .9999, .99999, 
       .1, .01, .001, .0001, .000001, .0000001, .00000001, .000000000001, 
       sparsity(dfm(data_corpus_inaugural)),
       sparsity(dfm(data_corpus_irishbudget2010)),
       .12312431242134)
for (i in s) 
    print(paste0(format(i, width = 10),  ":  ", quanteda:::format_sparsity(i)))
print(as.dfm(Matrix::rsparsematrix(1000, 1000, density = 0.9999)))
print(as.dfm(Matrix::rsparsematrix(10000, 10000, density = 0.00001)))



