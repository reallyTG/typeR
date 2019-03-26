library(PairedData)


### Name: Blink
### Title: Blink data from Preece (1982, Table 2)
### Aliases: Blink
### Keywords: datasets

### ** Examples

data(Blink)

# Visualizing two "outliers"
with(Blink,plot(paired(Straight,Oscillating),type="profile"))

# Interestingly, the differences for the two outliers are quite "normal"
# so their influence on the t test is negligible
with(Blink,qqnorm(Straight-Oscillating))
with(Blink,qqline(Straight-Oscillating))



