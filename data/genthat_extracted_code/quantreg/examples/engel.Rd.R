library(quantreg)


### Name: engel
### Title: Engel Data
### Aliases: engel
### Keywords: datasets

### ** Examples

## See also    demo("engel1")
##             --------------

data(engel)
plot(engel, log = "xy",
     main = "'engel' data  (log - log scale)")
plot(log10(foodexp) ~ log10(income), data = engel,
     main = "'engel' data  (log10 - transformed)")
taus <- c(.15, .25, .50, .75, .95, .99)
rqs <- as.list(taus)
for(i in seq(along = taus)) {
  rqs[[i]] <- rq(log10(foodexp) ~ log10(income), tau = taus[i], data = engel)
  lines(log10(engel$income), fitted(rqs[[i]]), col = i+1)
}
legend("bottomright", paste("tau = ", taus), inset = .04,
       col = 2:(length(taus)+1), lty=1)



