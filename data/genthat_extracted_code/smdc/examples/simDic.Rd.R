library(smdc)


### Name: simDic
### Title: Document Similarity using Dictionary
### Aliases: simDic
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (docMatrix1, docMatrix2, scoreDict, breaks = seq(-1, 
    1, length = 11), norm = FALSE, method = "cosine", scoreFunc = mean) 
{
    library("proxy")
    words <- unique(rbind(matrix(rownames(docMatrix1)), matrix(rownames(docMatrix2))))
    words <- words[order(words)]
    wordScores <- rep(NA, length(words))
    for (i in 1:length(words)) {
        cond <- (scoreDict[, 1] == words[i])
        value <- scoreDict[cond, 2]
        if (length(value) != 0) {
            wordScores[i] <- scoreFunc(value, na.rm = TRUE)
        }
    }
    names(breaks) <- cut(breaks, breaks)
    wordClass <- cut(wordScores, breaks)
    names(wordClass) <- words
    docFreq1 <- conv2Freq(docMatrix1, wordClass, breaks)
    docFreq2 <- conv2Freq(docMatrix2, wordClass, breaks)
    colnames(docFreq1) <- paste("r_", colnames(docMatrix1), sep = "")
    colnames(docFreq2) <- paste("c_", colnames(docMatrix2), sep = "")
    sim <- as.matrix(simil(t(cbind(docFreq1, docFreq2)), method = method))[colnames(docFreq1), 
        colnames(docFreq2)]
    rownames(sim) <- colnames(docMatrix1)
    colnames(sim) <- colnames(docMatrix2)
    if (norm) {
        sim <- normalize(sim)
    }
    return(sim)
  }



