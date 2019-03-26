library(SAR)


### Name: sar
### Title: Fit a SAR model
### Aliases: sar sar.data.frame sar.default print.sar

### ** Examples


data(ms_usage)

## all of these fit the same model:

# fit a SAR model from a series of vectors
mod1 <- sar(user=ms_usage$user, item=ms_usage$item, time=ms_usage$time)

# fit a model from a data frame, naming the variables to use
mod2 <- sar(ms_usage, user="user", item="item", time="time")

# fit a model from a data frame, using default variable names
mod3 <- sar(ms_usage)




