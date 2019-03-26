library(smbinning)


### Name: smbinning.monotonic
### Title: Monotonic Binning
### Aliases: smbinning.monotonic

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Example 1: Monotonic Binning (Increasing Good Rate per Bin)
smbinning(df=smbsimdf2,y="fgood2",x="chr2",p=0.05)$ivtable # Run regular binning
smbinning.monotonic(df=smbsimdf2,y="fgood2",x="chr2",p=0.05)$ivtable # Run monotonic binning
 
# Example 2: Monotonic Binning (Decreasing Good Rate per Bin)
smbinning(df=smbsimdf2,y="fgood3",x="chr3",p=0.05)$ivtable # Run regular binning
smbinning.monotonic(df=smbsimdf2,y="fgood3",x="chr3",p=0.05)$ivtable # Run monotonic binning



