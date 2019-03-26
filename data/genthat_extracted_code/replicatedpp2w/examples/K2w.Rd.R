library(replicatedpp2w)


### Name: K2w
### Title: Two-Way ANOVA-Like Method to Analyze Replicated Point Patterns
### Aliases: K2w print.k2w plot.k2w
### Keywords: spatial

### ** Examples


# Get the data
data(croton)

croton.2w <- K2w(pplist=croton$list.ppp,  r=seq(0,8, by=0.1),               
               tratA=croton$elevation, tratB=croton$slope, nsim=99)

croton.2w

plot(croton.2w)

plot(croton.2w, "tratB")





