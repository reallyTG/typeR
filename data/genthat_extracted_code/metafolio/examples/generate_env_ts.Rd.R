library(metafolio)


### Name: generate_env_ts
### Title: Create an environmental time series.
### Aliases: generate_env_ts

### ** Examples

types <- c("sine", "arma", "regime", "linear", "linear_arma", "constant")
x <- list()
for(i in 1:6) x[[i]] <- generate_env_ts(n_t = 100, type = types[i])
op <- par(mfrow = c(5, 1), mar = c(3,3,1,0), cex = 0.7)
for(i in 1:6) plot(x[[i]], type = "o", main = types[i])
par(op)



