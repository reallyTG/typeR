library(metasens)


### Name: print.limitmeta
### Title: Print and summary method for limit meta-analysis
### Aliases: print.limitmeta summary.limitmeta print.summary.limitmeta
### Keywords: print

### ** Examples

data(nsaids)
m1 <- metabin(Ee, Ne, Ec, Nc,
              data=nsaids, sm="OR", method="Inverse")

print(limitmeta(m1), digits=2)



