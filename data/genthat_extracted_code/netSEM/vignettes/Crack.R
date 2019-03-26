## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the crack data set and preview column metadata
#  data(crack)
#  ?crack
#  
#  ## Run netSEM
#  ans <- netSEMm(crack)
#  
#  ## Subset dataset with three cutoffs
#  res <- subsetData(ans, cutoff=c(0.4, 0.5, 0.6))
#  
#  ## Plot the network model
#  plot(ans, res)

## ---- out.width="675px", echo=FALSE--------------------------------------
knitr::include_graphics("crackplot.png")

