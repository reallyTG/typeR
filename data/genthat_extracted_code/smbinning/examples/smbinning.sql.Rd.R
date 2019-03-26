library(smbinning)


### Name: smbinning.sql
### Title: SQL Code
### Aliases: smbinning.sql

### ** Examples

# Load library and its dataset
library(smbinning)

# Example 1: Binning a numeric variable
result=smbinning(df=smbsimdf1,y="fgood",x="cbs1") # Run and save result
smbinning.sql(result)

# Example 2: Binning for a factor variable
result=smbinning.factor(df=smbsimdf1,x="inc",y="fgood",maxcat=11)
smbinning.sql(result)

# Example 3: Customized binning for a factor variable
result=smbinning.factor.custom(
  df=smbsimdf1,x="inc",y="fgood",
  c("'W01','W02'","'W03','W04','W05'",
    "'W06','W07'","'W08','W09','W10'"))
smbinning.sql(result)



