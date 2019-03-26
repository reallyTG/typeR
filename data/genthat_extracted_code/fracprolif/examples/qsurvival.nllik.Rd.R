library(fracprolif)


### Name: qsurvival.nllik
### Title: Negative Log-Likelihood of a Survival Function
### Aliases: qsurvival.nllik

### ** Examples

  data(ca1d.erlotinib)
  mitotic.lifespans <-
    subset(ca1d.erlotinib, !End.of.Expt & 
                           !Death        & 
                           !is.na(Lifespan))$Lifespan
  censored.lifespans <- 
    subset(ca1d.erlotinib, End.of.Expt  & 
                           !Death        & 
                           !is.na(Lifespan))$Lifespan
                           
  mle(function(mean, sd, Q){
       qsurvival.nllik("norm", mitotic.lifespans, censored.lifespans, Q, mean, sd)
     },
     method='L-BFGS-B',
     lower=list(mean=8,  sd=0.1, Q=0.01),
     upper=list(mean=30, sd=20,  Q=0.9),
     start=list(mean=mean(mitotic.lifespans), 
                sd=sd(mitotic.lifespans),
                Q = 0.5))



