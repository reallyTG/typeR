library(wql)


### Name: oxySol
### Title: Dissolved oxygen at saturation
### Aliases: oxySol
### Keywords: manip

### ** Examples


# Convert DO into % saturation for 1-m depth at Station 32.
# Use convention of expressing saturation at 1 atm.
sfb1 <- subset(sfbay, depth == 1 & stn == 32)
dox.pct <- with(sfb1, 100 * dox/oxySol(temp, sal))
summary(dox.pct)




