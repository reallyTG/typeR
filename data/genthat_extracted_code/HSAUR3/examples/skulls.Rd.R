library(HSAUR3)


### Name: skulls
### Title: Egyptian Skulls
### Aliases: skulls
### Keywords: datasets

### ** Examples


  data("skulls", package = "HSAUR3")
  means <- tapply(1:nrow(skulls), skulls$epoch, function(i)
               apply(skulls[i,colnames(skulls)[-1]], 2, mean))
  means <- matrix(unlist(means), nrow = length(means), byrow = TRUE)
  colnames(means) <- colnames(skulls)[-1]
  rownames(means) <- levels(skulls$epoch)
  pairs(means,
      panel = function(x, y) {
          text(x, y, levels(skulls$epoch))
      })




