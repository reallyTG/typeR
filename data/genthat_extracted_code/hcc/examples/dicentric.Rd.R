library(hcc)


### Name: dicentric
### Title: Radiation dose effects on chromosomal abnormality
### Aliases: dicentric
### Keywords: datasets

### ** Examples

data(dicentric)
dicentric$dosef <- factor(dicentric$doseamt)
rmod <- glm(ca ~ offset(log(cells))+log(doserate)*dosef, family=poisson,dicentric)
x <- dicentric[,4]
res <- resid(rmod)
hctest(x, res)



