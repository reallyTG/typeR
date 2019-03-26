library(clValid)


### Name: plot.sota
### Title: Plot Function for a SOTA Object
### Aliases: plot.sota
### Keywords: cluster hplot

### ** Examples

data(mouse)
express <- mouse[,c("M1","M2","M3","NC1","NC2","NC3")]
rownames(express) <- mouse$ID

sotaCl <- sota(as.matrix(express), 4)
names(sotaCl)
sotaCl
plot(sotaCl)
plot(sotaCl, cl=2)




