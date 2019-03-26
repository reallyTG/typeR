library(paramlink)


### Name: IBDestimate
### Title: Relatedness estimation
### Aliases: IBDestimate

### ** Examples


# Simulate marker data for two siblings
x = nuclearPed(2)
x = setPlotLabels(x, c("Sib1", "Sib2"), c(3,4))
x = simpleSim(x, 200, 1:2) # 200 equifrequent SNPs

# Estimate the IBD coefficients for the siblings
est1 = IBDestimate(x, ids=c(3,4))

# Estimate should be the same if pedigree structure is unknown
xlist = list(branch(x, 3), branch(x, 4))
est2 = IBDestimate(xlist, ids=c(3,4)) 
stopifnot(identical(est1, est2))

# If the pedigree has plot.labels, they can be used as IDs
est3 = IBDestimate(x, ids=c("Sib1", "Sib2"))
stopifnot(identical(est1, est3))




