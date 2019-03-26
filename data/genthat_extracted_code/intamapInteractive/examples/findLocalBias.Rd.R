library(intamapInteractive)


### Name: findLocalBias
### Title: Finds (and removes) biases between overlapping networks
### Aliases: findLocalBias removeLocalBias
### Keywords: spatial

### ** Examples


# Assuming that the soil type is the source of biases
data(meuse)
coordinates(meuse) = ~x+y


lb = findLocalBias(meuse,gid = "soil",formulaString=as.formula(zinc~1))
lb$single$bias

meuseUnbias = removeLocalBias(meuse,localBias = lb, gid = "soil",
    formulaString = zinc~1)



