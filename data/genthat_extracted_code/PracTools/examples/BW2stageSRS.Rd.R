library(PracTools)


### Name: BW2stageSRS
### Title: Relvariance components for 2-stage sample
### Aliases: BW2stageSRS
### Keywords: methods survey

### ** Examples

data(MDarea.pop)
MDsub <- MDarea.pop[1:100000,]
    # psu's are defined by PSU variable
BW2stageSRS(abs(MDsub$Hispanic-2), psuID=MDsub$PSU)
    # psu's are defined by SSU variable
BW2stageSRS(abs(MDsub$Hispanic-2), psuID=MDsub$SSU)



