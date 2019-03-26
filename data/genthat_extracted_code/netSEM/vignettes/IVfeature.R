## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the acrylic data set
#  data("IVfeature")
#  
#  ## Run netSEM
#  ans <- netSEMm(IVfeature)
#  
#  ## Subset dataset with three cutoff
#  res <- subsetData(ans,cutoff = c(0.25,0.5,0.8))
#  
#  ## Plot the network model
#  plot(ans,res)
#  

## ---- out.width="675px", echo=FALSE--------------------------------------
knitr::include_graphics("IVfeature.png")

