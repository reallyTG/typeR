library(philentropy)


### Name: gJSD
### Title: Generalized Jensen-Shannon Divergence
### Aliases: gJSD

### ** Examples


Prob <- rbind(1:10/sum(1:10), 20:29/sum(20:29), 30:39/sum(30:39))

# compute the Generalized JSD comparing the PS probability matrix
gJSD(Prob)




