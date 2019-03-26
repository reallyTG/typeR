library(bayfoxr)


### Name: plot.prediction
### Title: Plot a 'prediction' object.
### Aliases: plot.prediction

### ** Examples

data(bassriver)

# Using the "pooled annual" calibration model:
sst <- predict_seatemp(bassriver$d18o, d18osw=0.0, 
                       prior_mean=30.0, prior_std=20.0)

predictplot(x=bassriver$depth, y=sst, ylim=c(20, 40), 
            ylab="SST (°C)", xlab="Depth (m)")




