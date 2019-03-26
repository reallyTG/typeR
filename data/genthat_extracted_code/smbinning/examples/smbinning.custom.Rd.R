library(smbinning)


### Name: smbinning.custom
### Title: Customized Binning
### Aliases: smbinning.custom

### ** Examples

# Load library and its dataset
library(smbinning) # Load package and its data

# Custom cutpoints using percentiles (20% each)
cbs1cuts=as.vector(quantile(smbsimdf1$cbs1, probs=seq(0,1,0.2), na.rm=TRUE)) # Quantiles
cbs1cuts=cbs1cuts[2:(length(cbs1cuts)-1)] # Remove first (min) and last (max) values

# Example: Customized binning
result=smbinning.custom(df=smbsimdf1,y="fgood",x="cbs1",cuts=cbs1cuts) # Run and save
result$ivtable # Tabulation and Information Value



