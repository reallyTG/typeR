library(metasens)


### Name: limitmeta
### Title: Limit meta-analysis
### Aliases: limitmeta

### ** Examples

data(nsaids)
m1 <- metabin(Ee, Ne, Ec, Nc,
              data=nsaids, sm="OR", method="Inverse")

print(summary(limitmeta(m1)), digits=2)



