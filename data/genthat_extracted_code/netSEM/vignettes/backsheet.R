## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the backsheet data set
#  data(backsheet)
#  
#  ## Run netSEM
#  ans <- netSEMm(backsheet)
#  
#  ## Subset dataset with three cutoff
#  res <- subsetData(ans,cutoff=c(0.3,0.8,0.9))
#  
#  ## Plot the network model
#  plot(ans,res)
#  

## ---- out.width="675px", echo=FALSE--------------------------------------
knitr::include_graphics("backsheet.png")

