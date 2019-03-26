library(kendallRandomWalks)


### Name: transform_kendall_rw
### Title: Transforming (scaling and shifting) Kendall random walks
### Aliases: transform_kendall_rw

### ** Examples

kendall_simulations <- simulate_kendall_rw(10, 1000, runif, 0.5)
scaled_kendall <- transform_kendall_rw(kendall_simulations, (1:1000)^(-2))
scaled_kendall # kendall random walked scaled by the sequence n^(-1/alpha)
scaled_data <- scaled_kendall$simulation # simulated values
plot(scaled_kendall)




