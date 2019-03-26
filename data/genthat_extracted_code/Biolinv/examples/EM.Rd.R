library(Biolinv)


### Name: EM
### Title: Runs the EM algorithm.
### Aliases: EM

### ** Examples

data('nzp')
data('frogs')
randp<- RPG(rpopn=1000, boundary=nzp, SP= 'random_frog')
frogsEM<- EM(dataset= frogs, randompoints= randp, sigma=6, pi=0.5)



