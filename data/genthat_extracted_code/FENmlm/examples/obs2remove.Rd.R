library(FENmlm)


### Name: obs2remove
### Title: Finds observations to be removed from ML estimation with
###   factors/clusters
### Aliases: obs2remove

### ** Examples


base = iris
# v6: Petal.Length with only 0 values for 'setosa'
base$v6 = base$Petal.Length
base$v6[base$Species == "setosa"] = 0

(x = obs2remove(v6 ~ Species, base))
attr(x, "cluster")

# The two results are identical:
res_1 = femlm(v6 ~ Petal.Width | Species, base)
# => warning + obsRemoved is created

res_2 = femlm(v6 ~ Petal.Width | Species, base[-x, ])
# => no warning because observations are removed before

res2table(res_1, res_2)

all(res_1$obsRemoved == x)




