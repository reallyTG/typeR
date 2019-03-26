library(metasens)


### Name: nsaids
### Title: NSAIDS in acute pain
### Aliases: nsaids
### Keywords: datasets

### ** Examples

data(nsaids)
m1 <- metabin(Ee, Ne, Ec, Nc,
              data=nsaids, sm="OR", method="Inverse")

print(limitmeta(m1), digits=2)



