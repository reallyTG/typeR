library(R3port)


### Name: freq
### Title: Calculate frequency statistics on data frame
### Aliases: freq

### ** Examples


data(Indometh)
freq(Indometh,vars="time",id="Subject",
        denom=nrow(Indometh),total="",totaldenom=nrow(Indometh))



