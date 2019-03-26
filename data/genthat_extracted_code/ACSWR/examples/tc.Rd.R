library(ACSWR)


### Name: tc
### Title: The Toluca Company Labour Hours against Lot Size
### Aliases: tc
### Keywords: linear regression model

### ** Examples

data(tc)
tclm <- lm(Labour_Hours~Lot_Size,data=tc)
tclm$coefficients



