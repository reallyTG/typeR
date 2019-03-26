library(IPMpack)


### Name: dataIPMpackSuccisa2
### Title: Succisa pratensis Dataset
### Aliases: dataIPMpackSuccisa2
### Keywords: datasets

### ** Examples

data(dataIPMpackSuccisa2)
print(head(dataIPMpackSuccisa2))

Sp <- dataIPMpackSuccisa2

fo<-makeFecObj(Sp, Formula = list(fec1Bolt ~ size+size2, 
    fec2Stem ~ size, fec3Head ~ size), 
        Family = c("binomial","poisson","poisson"), 
            Transform=c("none","-1","none"), 
            fecConstants = data.frame(seedsPerHead=50,
            seedlingEstablishmentRate= 0.02))

co<-makeClonalObj(Sp, Formula = list(cloning ~ size, clonesNext ~ size), 
    Family = c("binomial","poisson"), Transform=c("none","-1"), 
       offspringSizeExplanatoryVariables = "size")





