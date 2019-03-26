library(ecolottery)


### Name: abund
### Title: Compute absolute and relative abundances in the local community
###   and the reference pool
### Aliases: abund
### Keywords: species abundance distribution regional pool local community

### ** Examples

# Simulation of a neutral community including 500 individuals
J <- 500; theta <- 50; m <- 0.05;
comm1a <- coalesc(J, m, theta) 
abund1a <- abund(comm1a) 
  
# Log-series distribution of regional abundances
fit <- vegan::fisherfit(abund1a$pool$ab)
freq <- as.numeric(names(fit$fisher))
plot(log(freq), fit$fisher,
     xlab = "Frequency (log)",
     ylab = "Species", type = "n")
rect(log(freq - 0.5), 0, log(freq + 0.5), fit$fisher, col="skyblue")

alpha <- fit$estimate
k <- fit$nuisance

curve(alpha * k^exp(x) / exp(x), log(0.5), max(log(freq)),
      col = "red", lwd = 2, add = TRUE)

# Relationship between local and regional abundances
par(mfrow=c(1, 2))
plot(abund1a$pool[rownames(abund1a$com), "relab"],
  abund1a$com$relab,
  main = "m = 0.05",
  xlab = "Regional abundance",
  ylab = "Local abundance",
  log = "xy")
abline(0,1)

# With higher immigration rate
m <- 0.95
comm1b <- coalesc(J, m, theta) 
abund1b <- abund(comm1b) 
plot(abund1b$pool[rownames(abund1b$com),"relab"],
  abund1b$com$relab,
  main = "m = 0.95",
  xlab = "Regional abundance",
  ylab = "Local abundance",
  log = "xy")
abline(0,1)



