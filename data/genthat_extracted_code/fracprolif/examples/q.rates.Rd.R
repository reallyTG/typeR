library(fracprolif)


### Name: q.rates
### Title: Estimate Quiescence-Growth Model Rates
### Aliases: q.rates

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
  r <- q.rates("emg", q.mle.emg.estimate(mitotic.lifespans, censored.lifespans))
  
  summary(r)
  
  r['d'] # Rate of division
  r['q'] # Rate of quiescense



