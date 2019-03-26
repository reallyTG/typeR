library(secrdesign)


### Name: count
### Title: Extract Summaries
### Aliases: count coef.summary predict.summary count.summary
### Keywords: datagen

### ** Examples


## generate some simulations
scen1 <- make.scenarios(D = c(5,10), sigma = 25, g0 = 0.2)
traps1 <- make.grid(6, 6, spacing = 25)
sims1 <- run.scenarios(nrepl = 2, trapset = traps1, scenarios =
     scen1, seed = 345, fit = TRUE, extractfn = summary)

## view the results
count(sims1)$output
predict(sims1)$output

summary(sims1)  ## header only

summary(count(sims1))   # equivalent to following
summary(select.stats(count(sims1), parameter = 'Number'))  

summary(predict(sims1)) # default select.stats parameter = 'D'
summary(select.stats(predict(sims1), parameter = 'sigma')  )




