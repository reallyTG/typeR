## ---- message=FALSE, eval=FALSE------------------------------------------
#  
#  ## Load the PET data set
#  data(pet)
#  
#  ## Run netSEM
#  ans <- netSEMm(pet)
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
#  "YI" is the endogenous and all other variables are considered as exogenous.
#  

## ---- out.width="675px", echo=FALSE--------------------------------------
knitr::include_graphics("pet.png")

## ---- message=FALSE, eval=FALSE------------------------------------------
#  # Use pathwayRMSE to examine errors of network paths
#  pathwayRMSE(ans)

