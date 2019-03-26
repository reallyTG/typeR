library(kdetrees)


### Name: kdetrees
### Title: Identify discordant trees in a sample
### Aliases: kdetrees

### ** Examples

kdeobj <- kdetrees(apicomplexa)
print(kdeobj)
kdeobj$outliers

kdetrees(apicomplexa, k=2.0, distance="dissimilarity",topo.only=FALSE)



