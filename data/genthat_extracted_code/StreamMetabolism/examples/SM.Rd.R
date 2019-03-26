library(StreamMetabolism)


### Name: SM
### Title: Calculate Ecosystem Production with the Single Station Method
### Aliases: SM
### Keywords: math

### ** Examples

#zoo real data
#velocity 0.6
#depth 0.4572
#sunrise 6:00AM
#sunset 8:15PM
#K/96 to get K per dt (i.e., 96 15 min interval in 1 day)
data(DOTemp)

K <- ODobbins(0.6, 0.4572)
prod <- SM(min_interval=15, K=K/96,
depth=0.4572, temp=DOTemp[,1], DO=DOTemp[,2],
day="8/18/70", start="00:00:00",
end="23:45:00", sr="06:00:00", ss="20:15:00")
prod




