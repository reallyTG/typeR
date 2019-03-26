library(ade4)


### Name: casitas
### Title: Enzymatic polymorphism in Mus musculus
### Aliases: casitas
### Keywords: datasets

### ** Examples

data(casitas)
casitas.pop <- as.factor(rep(c("dome", "cast", "musc", "casi"), 
    c(24,11,9,30)))
table(casitas.pop,casitas[,1]) 
casi.genet <- char2genet(casitas, casitas.pop)
names(casi.genet)



