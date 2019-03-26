library(smdc)


### Name: simSum
### Title: Summary of Document Similarity
### Aliases: simSum
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (sim) 
{
    results <- rep(0, ncol(sim))
    names(results) <- colnames(sim)
    scores <- rep(0, ncol(sim))
    for (i in 1:ncol(sim)) {
        scores[i] <- max(sim[, i])
        results[i] <- rownames(sim)[which.max(sim[, i])]
    }
    summary <- as.list(NULL, length = nrow(sim))
    for (i in 1:nrow(sim)) {
        cond <- results == rownames(sim)[i]
        summary[[i]] <- names(which(cond[order(-scores)]))
    }
    names(summary) <- rownames(sim)
    return(summary)
  }



