library(SyNet)


### Name: acshgral
### Title: Generalized ACSH score
### Aliases: acshgral
### Keywords: methods

### ** Examples

  data(mayflynz)
  procnz <- procdnpoint(mayflynz)
  nsp <- length(procnz$Label)
  testmt <- acsh(procnz) 
  # Following, we will produce a matrix of ACSH scores for pairs of species,
  # but now with the generalized form.
  calcmt <- matrix(0, nrow = nsp, ncol = nsp)
  for(i in 1:(nsp-1)) 
    for(j in (i+1):nsp)
      calcmt[i,j] <- acshgral(procnz, c(i, j)) 
  all(calcmt + t(calcmt) == testmt) 
  #The previous statement should be TRUE because the generalized ACSH 
  #corresponds to the standard pairwise ACSH when 
  #two species are submitted to the function "acshgral".
  ################
  ################
  # This code makes explicit the above idea of hierarchical clustering based on the minimization 
  # of the ACSH profile throughout the nested structure of groups formed during the merging process
  diag(testmt) <- Inf
  newdist <- matrix(-1, nsp, nsp)
  notation <- as.character(1:nsp)
  classes <- 1:nsp
  analyze <- array(TRUE, nsp)
  while(max(classes)!= 1) {
    aux <- which.min(testmt) 
    items <- sort(c(row(testmt)[aux], col(testmt)[aux]))
    #Update cluster structure and ACSH scores
    ngr <- which(classes %in% items)
    classes[ngr] <- items[1]
    notation[items[1]] <- paste("(", notation[items[1]], " ", notation[items[2]], ")", sep = "")
    newdist[items[1], items[2]] <- newdist[items[2], items[1]] <- testmt[aux]
    analyze[items[2]] <- FALSE
    testmt[items, ] <- testmt[, items] <- Inf
    for(i in which(analyze)) {
      ogr <- which(classes == classes[i])
      if(i == items[1]) next 
      testmt[items[1], i] <- testmt[i, items[1]] <- acshgral(procnz, c(ngr, ogr)) 
    }
  }
  #Plot the respective dendrogram
  tt <- max(newdist) + 1 
  newdist <- ifelse(newdist == -1, tt, newdist)
  plot(hclust(as.dist(newdist), method = "single"), label = procnz$Label, 
       cex = 0.7, xlab = "", ylab = "Generalized ACSH")
  #Display relationships into a parenthetical notation. You can track the indices of the species in the
  #leaves of the following dendrogram
  plot(hclust(as.dist(newdist), method = "single"))
  cat(notation[1])



