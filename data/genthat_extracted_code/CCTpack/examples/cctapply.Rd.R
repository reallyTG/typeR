library(CCTpack)


### Name: cctapply
### Title: Primary function to perform model-based consensus analysis:
###   loads the data and fits the consensus model. Allows for model-based
###   clustering based on the numbers of "clusters" specified.  Options are
###   also available to run diagnostics on the fit, and to export the
###   results to saved files. Based on cultural consensus theory (CCT)
###   models for data matrices of binary, ordered categorical, or
###   continuous response data.
### Aliases: cctapply

### ** Examples

# Load Data (here binary responses, 1/0 for yes/no)
data(hotcold)

# Calculate scree plot to decide how many clusters to run, looks like 2 clusters here
dat <-  cctscree(hotcold)

# Retrieve factors from the scree plot
cctfac(dat)    # dat$factors

# Fit the Model  
# cctfit <- cctapply(data = hotcold, clusters = 2, itemdiff = TRUE, samples = 10000, 
#                     chains = 3, burnin = 2000, seed = 1, runchecks = FALSE)

# Calculate Fit Diagnostics (Posterior Predictive Checks)
# cctfit <- cctppc(cctfit)

# Plot Parameter Results
# cctresults(cctfit) 		  

# Tables of Subject and Item Parameter Values and Credible Intervals
# cctsubj(cctfit)      # cctfit$subj
# cctsubjhdi(cctfit)   # cctfit$subjhdi
# cctitem(cctfit)      # cctfit$item
# cctitemhdi(cctfit)   # cctfit$itemhdi

# Show Missing Value Model Estimates if there was missing data
# cctmvest(cctfit)

# Export Results (saves data and plots)
# cctexport(cctfit,filename="CCTpackdata.Rdata") 

# Load and Fit Example Data for ordered categorical or continuous responses
# data(raterdata)

# cctfit <- cctapply(data = raterdata, clusters = 1, itemdiff = TRUE, samples = 10000, 
#                     chains = 3, burnin = 2000, seed = 1, runchecks = FALSE)

# data(continuousdata)
# cctfit <- cctapply(data = continuousdata, clusters = 1, itemdiff = TRUE, samples = 10000, 
#                     chains = 3, burnin = 2000, seed = 1, runchecks = FALSE)

##Note: if an insufficient memory message occurs, you can increase the
##memory allocation by the command 'memory.limit(25000)'  (or as high as needed)



