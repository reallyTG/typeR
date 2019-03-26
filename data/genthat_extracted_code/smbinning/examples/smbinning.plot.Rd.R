library(smbinning)


### Name: smbinning.plot
### Title: Plots after binning
### Aliases: smbinning.plot

### ** Examples

# Load library and its dataset
library(smbinning)

# Example 1: Numeric variable (1 page, 4 plots)
result=smbinning(df=smbsimdf1,y="fgood",x="cbs1") # Run and save result
par(mfrow=c(2,2))
boxplot(smbsimdf1$cbs1~smbsimdf1$fgood,
        horizontal=TRUE, frame=FALSE, col="lightgray",main="Distribution")
mtext("Credit Score",3)
smbinning.plot(result,option="dist",sub="Credit Score")
smbinning.plot(result,option="badrate",sub="Credit Score")
smbinning.plot(result,option="WoE",sub="Credit Score")
par(mfrow=c(1,1))

# Example 2: Factor variable (1 plot per page)
result=smbinning.factor(df=smbsimdf1,y="fgood",x="inc",maxcat=11)
smbinning.plot(result,option="dist",sub="Income Level")
smbinning.plot(result,option="badrate",sub="Income Level")
smbinning.plot(result,option="WoE",sub="Income Level")



