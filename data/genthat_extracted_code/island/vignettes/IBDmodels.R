## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(island)

## ----ibd demonstration, fig.height=5, fig.width=7------------------------
set.seed(101100111)
dynamic <- ibd_models(n0 = 50, beta = 0.3, delta = 0.3, mu = 0.01, K = 300, time_v = 0:50, type = "Alonso")
plot(dynamic, type = "l", main = "Mainland-island model")

## ---- carrying capacity, fig.height=5, fig.width=7-----------------------
ts <- 0:100 #Time-vector
ccc <- seq(10, 100, 10) #Carrying capacities
out <- NULL #Initializing output
for (i in ccc){
pops <- matrix(nrow = 100, ncol = 101)
for (j in 1:100){
  sim <- ibd_models(n0 = 0, beta = 0.2, delta = 0.3, mu = 0.004, K = i, time_v = ts, 
                    type = "Alonso") #Simulations
  pops[j, ] <- (sim[, 2] > 0) * 1.0
}
out <- rbind(out, c(i, regular_sampling_scheme(pops, 1:101)))
}

#Plotting
plot(out[, 1], out[, 2], type = "b", xlab = "Carrying capacity", ylab = "Rate", 
     col = "darkgreen", main = "Effect of changes in the underlying population dynamics 
     over colonization and extinction rates")
lines(out[, 1], out[, 5], type = "b", col = "magenta")
legend(10, .35, legend=c("Colonization", "Extinction"),
       col=c("darkgreen", "magenta"), pch = 21, lty=1, pt.bg = "White",  cex=0.8)


## ----detectability, fig.height=5, fig.width=7----------------------------
ts <-  seq(0, 49, 7) #Time-vector
ccc <- seq(10, 100, 10) #Carrying capacities
out <- NULL
for (i in ccc){
pops <- matrix(nrow = 100, ncol = 24)
for (j in 1:100){
  sim <- ibd_models(n0 = sample(c(0,1), 1), beta = 0.24, delta = 0.3, mu = 0.004, K = i, time_v = ts, 
                    type = "Alonso")
  
  # Applying the detectability filter and preparing the data for sss_cedp
  filter1 <- (runif(8) < 1 - (1 - 0.7)^sim[, 2]) * 1.0 
  filter2 <- (runif(8) < 1 - (1 - 0.7)^sim[, 2]) * 1.0
  filter3 <- (runif(8) < 1 - (1 - 0.7)^sim[, 2]) * 1.0
  filtered <- cbind(filter1, filter2, filter3)
  filtered2 <- c(t(filtered))
  pops[j, ] <- filtered2
}

out <- rbind(out, c(i, unlist(sss_cedp(pops, seq(0, 49, 7), rep(3, 8), Colonization = 0.1, Extinction = 0.1, Phi_Time_0 = 0.5, Detectability = 0.7))))
}

plot(out[, 1], out[, 2], type = "b", xlab = "Carrying capacity", ylab = "Rate or probability", 
     col = "darkgreen", main = "Effect of changes in the underlying population dynamics 
     over cedp parameters", ylim = c(0, 1))
lines(out[, 1], out[, 3], type = "b", col = "magenta")
lines(out[, 1], out[, 4], type = "b", col = "blue")
lines(out[, 1], out[, 5], type = "b", col = "brown")
legend(80, .8, legend=c("Colonization", "Extinction", "Detectability", "P0"),
       col=c("darkgreen", "magenta", "blue", "brown"), pch = 21, lty=1, pt.bg = "White",  cex=0.8)


