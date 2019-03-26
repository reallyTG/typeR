library(SemiMarkov)


### Name: table.state
### Title: Table giving the numbers of observed transitions
### Aliases: table.state
### Keywords: documentation

### ** Examples


## Asthma control data
data(asthma)

# default description
# censoring is implicitly defined as a transition "h->h"
table.state(asthma)
table.state(asthma)$Ncens

# censoring defined as a transition to state "4"
asthma_bis<-asthma
for(i in 1:dim(asthma)[1]){if(asthma[i,2]==asthma[i,3]) asthma_bis[i,3]<-4}
table.state (asthma_bis, cens = 4)

## Definition of the model: states names and possible transtions
states_1 <- c("1","2","3")
mtrans_1 <- matrix(FALSE, nrow = 3, ncol = 3)
mtrans_1[1, 2:3] <- TRUE
mtrans_1[2, c(1,3)] <- c("W","E")
table.state(asthma, states = states_1, mtrans = mtrans_1)

   


