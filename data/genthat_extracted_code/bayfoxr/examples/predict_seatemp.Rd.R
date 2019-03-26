library(bayfoxr)


### Name: predict_seatemp
### Title: Predict sea-surface temperature given d18O of foram calcite and
###   seawater d18O.
### Aliases: predict_seatemp

### ** Examples

data(bassriver)

# Using the "pooled annual" calibration model:
sst <- predict_seatemp(bassriver$d18o, d18osw=0.0, 
                       prior_mean=30.0, prior_std=20.0)
head(quantile(sst))  # Show only the top few values

predictplot(x=bassriver$depth, y=sst, ylim=c(20, 40), 
            ylab="SST (°C)", xlab="Depth (m)")




