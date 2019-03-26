library(reproducer)


### Name: calculateSmallSampleSizeAdjustment
### Title: calculateSmallSampleSizeAdjustment
### Aliases: calculateSmallSampleSizeAdjustment

### ** Examples

df <- 2
c <- calculateSmallSampleSizeAdjustment(df)

df=c(5,10,17)
adjexact=calculateSmallSampleSizeAdjustment(df)
# adjexact=0.8407487 0.9227456 0.9551115
# Hedges and Olkin values 0.8408, 0.9228,0.9551
adjapprox=calculateSmallSampleSizeAdjustment(df,FALSE)
# adjapprox=0.8421053 0.9230769 0.9552239



