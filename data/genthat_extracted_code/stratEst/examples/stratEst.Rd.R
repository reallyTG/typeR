library(stratEst)


### Name: stratEst
### Title: Estimation function for strategy estimation
### Aliases: stratEst

### ** Examples

## Replication of Dal Bo and Frechette (2011), Table 7 on page 424
## Results for the first treatment with delta = 1/2 and R = 32 (column 1 of Table 7)
data <- DF2011[DF2011$treatment == 1,]
strats <- rbind(ALLD,ALLC,GRIM,TFT,T2,WSLS)
stratEst(data,strats)

## Latent class regression with data from Dal Bo and Frechette (2011)
## For the two treatments with R = 32, introduce a dummy which is one if delta = 3/4
data <- DF2011[DF2011$treatment == 1 | DF2011$treatment == 4,]
strats <- rbind(ALLD,TFT)
covar <- as.matrix(as.numeric(data$treatment == 4 ))
stratEst(data,strats,covariates = covar,lcr.runs = 500)



