library(optiSel)


### Name: genecont
### Title: Calculates Genetic Contributions using Pedigrees.
### Aliases: genecont

### ** Examples


data(ExamplePed)
Pedig <- prePed(ExamplePed)
cont  <- genecont(Pedig)

plot(Pedig$Born, cont[,"276000803611144"], pch=18, ylim=c(0,1))
Pedig["276000803611144",]

#faster:
cont  <- genecont(Pedig, from="276000803611144")
head(cont)
plot(Pedig$Born, cont[,"276000803611144"], pch=18, ylim=c(0,1))



