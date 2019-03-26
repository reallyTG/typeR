library(incadata)


### Name: lt
### Title: Lead time from one date to another
### Aliases: lt

### ** Examples

lt("2017-02-10", "2017-02-16") # 6
lt("2017-02-16", "2017-02-10") # negative lead times ignored by default
lt("2017-02-16", "2017-02-10", TRUE) # -6



