library(accelmissing)


### Name: missing.rate
### Title: Computing Missing Rate
### Aliases: missing.rate
### Keywords: accelerometer accelmissing

### ** Examples

## missing rate calculation: uncomment and run the code below
# data(acceldata); attach(acceldata)
# missing.rate(label, flag, mark.missing=0, time.range=c("09:00", "20:59"))$total  

## create missing flag by 60 min criterion
# flag60 = create.flag(PA, window=60, mark.missing=0)
# mr = missing.rate(label, flag60, mark.missing=0, time.range=c("09:00", "20:59"))
# mr$total  #28.1 percent

## missing proportion by days
# mean(mr$table < 0.1)   # 45.8 percent



