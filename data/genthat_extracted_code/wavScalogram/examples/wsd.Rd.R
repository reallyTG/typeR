library(wavScalogram)


### Name: wsd
### Title: Windowed Scalogram Difference
### Aliases: wsd

### ** Examples


nt <- 1500
time <- 1:nt
sd_noise <-  0.2 #% In BolÃ³s et al. 2017 Figure 1, sd_noise = 1.
signal1 <- rnorm(n = nt, mean = 0, sd = sd_noise) + sin(time / 10)
signal2 <- rnorm(n = nt, mean = 0, sd = sd_noise) + sin(time / 10)
signal2[500:1000] = signal2[500:1000] + sin((500:1000) / 2)
## Not run: 
##D wsd <- wsd(signal1 = signal1, signal2 = signal2)
## End(Not run)




