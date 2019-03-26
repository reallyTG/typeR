library(mitml)


### Name: clusterMeans
### Title: Calculate cluster means
### Aliases: clusterMeans

### ** Examples

data(studentratings)

fml <- ReadDis + SES ~ ReadAchiev + (1|ID)
imp <- panImpute(studentratings, formula=fml, n.burn=1000, n.iter=100, m=5)

implist <- mitmlComplete(imp, print=1:5)

# * Example 1: single cluster means

# calculate cluster means (for each data set)
with(implist, clusterMeans(ReadAchiev, ID))

# ... person-adjusted cluster means
with(implist, clusterMeans(ReadAchiev, ID, adj=TRUE))

# ... groupwise cluster means
with(implist, clusterMeans(ReadAchiev, ID, group=Sex))

# * Example 2: automated cluster means using 'for' and 'assign'

# calculate multiple cluster means within multiply imputed data sets
within(implist,{
  vars <- c("ReadAchiev","MathAchiev","CognAbility")
  for(i in vars) assign(paste(i,"Mean",sep="."), clusterMeans(i,ID))
  rm(i,vars)
})



