library(smdc)


### Name: simDoc
### Title: Document Similarity
### Aliases: simDoc
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (docMatrix1, docMatrix2, norm = FALSE, method = "cosine") 
{
    library("proxy")
    exDocMatrix <- uniform(docMatrix1, docMatrix2)
    exDocMatrix1 <- exDocMatrix[[1]]
    exDocMatrix2 <- exDocMatrix[[2]]
    colnames(exDocMatrix1) <- paste("r_", colnames(docMatrix1), 
        sep = "")
    colnames(exDocMatrix2) <- paste("c_", colnames(docMatrix2), 
        sep = "")
    sim <- as.matrix(simil(t(cbind(exDocMatrix1, exDocMatrix2)), 
        method = method))[colnames(exDocMatrix1), colnames(exDocMatrix2)]
    rownames(sim) <- colnames(docMatrix1)
    colnames(sim) <- colnames(docMatrix2)
    if (norm) {
        sim <- normalize(sim)
    }
    return(sim)
  }



