library(IMIFA)


### Name: USPSdigits
### Title: USPS handwritten digits
### Aliases: USPSdigits
### Keywords: datasets

### ** Examples

# Load the data and record the labels
data(USPSdigits)
ylab  <- USPSdigits$train[,1]
train <- USPSdigits$train[,-1]

# Examine the effect of discarding peripheral pixels
SDs   <- apply(train, 2, sd)
ind   <- SDs > 0.7
dat   <- train[,ind]

hist(SDs, breaks=200, xlim=c(0, 1))
rect(0.7, 0, 1, 12, col=2, density=25)

show_digit(ind) # retained pixels are shown in black



