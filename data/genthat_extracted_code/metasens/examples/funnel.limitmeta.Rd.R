library(metasens)


### Name: funnel.limitmeta
### Title: Funnel plot for limit meta-analysis
### Aliases: funnel.limitmeta
### Keywords: hplot

### ** Examples

data(nsaids)
m1 <- metabin(Ee, Ne, Ec, Nc,
              data=nsaids, sm="OR", method="Inverse")

print(summary(limitmeta(m1)), digits=2)

funnel(limitmeta(m1))

#
# Print results on log scale
#
print(summary(limitmeta(m1)), digits=2, backtransf=FALSE)
funnel(limitmeta(m1), backtransf=FALSE)



