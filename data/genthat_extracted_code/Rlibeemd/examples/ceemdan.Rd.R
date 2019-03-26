library(Rlibeemd)


### Name: ceemdan
### Title: CEEMDAN decomposition
### Aliases: ceemdan

### ** Examples

imfs <- ceemdan(UKgas, threads = 1)
# trend extraction
ts.plot(UKgas, imfs[, ncol(imfs)], col = 1:2, 
        main = "Quarterly UK gas consumption", ylab = "Million therms")

# CEEMDAN for logarithmic demand, note that increasing ensemble size 
# will produce smoother results
imfs <- ceemdan(log(UKgas), ensemble_size = 50, threads = 1)
plot(ts.union("log(obs)" = log(UKgas), Seasonal = imfs[, 1], 
     Irregular = rowSums(imfs[, 2:5]), Trend = imfs[, 6]), 
     main = "Quarterly UK gas consumption")



