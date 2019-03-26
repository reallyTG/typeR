## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the PET data set
#  data(metal)
#  
#  ## Run netSEM
#  ans <- netSEMm(metal, str = TRUE)
#  
#  ## Subset dataset with three cutoff
#  res <- subsetData(ans,cutoff=c(0.3,0.6,0.8))
#  
#  ## Plot the network model
#  plot(ans,res)
#  
#  
#  Network diagram for data
#  --------------------------
#  "Hardness" is the endogenous and all other variables are considered as exogenous.
#  

## ---- out.width="675px", echo=FALSE--------------------------------------
knitr::include_graphics("metal.png")

