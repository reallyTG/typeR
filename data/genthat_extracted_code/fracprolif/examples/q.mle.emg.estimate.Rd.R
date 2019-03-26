library(fracprolif)


### Name: q.mle.emg.estimate
### Title: Estimate Distribution Parameters based on EMG survival
### Aliases: q.mle.emg.estimate

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
  q.mle.emg.estimate(mitotic.lifespans, censored.lifespans)



