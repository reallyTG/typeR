library(MESS)


### Name: bdstat
### Title: Danish live births and deaths
### Aliases: bdstat
### Keywords: datasets

### ** Examples


data(bdstat)

plot(bdstat$year + bdstat$month/13, bdstat$birth, type="l")

# Create a table of births
# Remove year 2013 as it is incomplete
btable <- xtabs(births ~ year + month, data=bdstat, subset=(year<2013))

# Compute yearly birth frequencies per month
btable.freq <- prop.table(btable, margin=1)




