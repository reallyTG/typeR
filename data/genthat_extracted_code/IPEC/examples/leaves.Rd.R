library(IPEC)


### Name: leaves
### Title: Leaf Data of _Parrotia subaequalis_ (Hamamelidaceae)
### Aliases: leaves

### ** Examples

data(leaves)
attach(leaves)
# Choose a geographical population (see Table S1 in Wang et al. [2018] for details)
# 1: AJ; 2: HN; 3: HW; 4: HZ; 5: JD; 
# 6: JS; 7: SC; 8: TC; 9: TT; 10: TX
ind <- 1
L   <- Length[PopuCode == ind]
W   <- Width[PopuCode == ind] 
A   <- Area[PopuCode == ind]
x   <- L*W
fit <- lm(A ~ x-1)
summary(fit)

# Show the leaf areas of the 10 geographical populations
dev.new()
par(mar=c(5,6,2,2))
boxplot(Area~PopuCode, cex=1.5, cex.lab=1.5, cex.axis=1.5, 
        col="grey70", xlab=expression(bold("Population code")), 
        ylab=expression(bold(paste("Leaf area (cm", ""^{"2"}, ")", sep=""))),
        ylim=c(0, 50), xaxs="i", yaxs="i", las=1)



