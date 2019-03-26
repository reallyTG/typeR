library(MetaboLouise)


### Name: DataSimulateR
### Title: DataSimulateR
### Aliases: DataSimulateR

### ** Examples

Nmetabos <- 20L
Nrates <- 10L

Network <- NetworkCreateR(N = Nmetabos, BA_power = 0.5, BA_mValue = 4)

Rate_function <- RateFunctionBuildR(type = "sigmoid")

rate_vector <- round(5*runif(Nrates))

rate_mapping <- Network
active_rates <- which(Network == 1, arr.ind = TRUE)
for(rr in 1:nrow(active_rates)){
    rate_mapping[active_rates[rr,1], active_rates[rr,2]] <- sample(seq_along(rate_vector), size = 1)
    }
    
 No_influx <- DataSimulateR(NetworkMatrix = Network, dT = 0.01, Tstart = 0, Tstop = 3, 
                            T0_nodes = 100, rate_vector = rate_vector, rate_mapping = rate_mapping, 
                            RateFunctionObject = Rate_function, plot_out = TRUE)




