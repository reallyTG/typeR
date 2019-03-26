library(smbinning)


### Name: smbinning.metrics
### Title: Performance Metrics for a Classification Model
### Aliases: smbinning.metrics

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Example: Metrics Credit Score 1
smbinning.metrics(dataset=smbsimdf1,prediction="cbs1",actualclass="fgood",
                  report=1) # Show report
smbinning.metrics(dataset=smbsimdf1,prediction="cbs1",actualclass="fgood",
                  cutoff=600, report=1) # User cutoff
smbinning.metrics(dataset=smbsimdf1,prediction="cbs1",actualclass="fgood",
                  report=0, plot="auc") # Plot AUC
smbinning.metrics(dataset=smbsimdf1,prediction="cbs1",actualclass="fgood",
                  report=0, plot="ks") # Plot KS

# Save table with all details of metrics
cbs1metrics=smbinning.metrics(
  dataset=smbsimdf1,prediction="cbs1",actualclass="fgood",
  report=0, returndf=1) # Save metrics details



