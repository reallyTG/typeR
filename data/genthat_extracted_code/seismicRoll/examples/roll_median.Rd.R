library(seismicRoll)


### Name: roll_median
### Title: Rolling Median
### Aliases: roll_median

### ** Examples

a <- jitter(sin(0.1*seq(1e4)),amount=0.2)
indices <- sample(seq(1e4),20)
a[indices] <- a[indices]*10

# Outlier detection
b <- roll_hampel(a,10)
threshold <- 6
outliers <- which(b > threshold)

# Outlier replacement with median values
a_fixed <- a
a_fixed[outliers] <- roll_median(a,10)[outliers]

# Set up two plots
layout(matrix(seq(2)))
plot(a,type='l', col='gray60', main="Outliers detected")
points(outliers,a[outliers], col='red', lwd=2)

plot(a_fixed,type='l', col='gray60',
     main="Outliers replaced with rolling median")
points(outliers,a_fixed[outliers], col='red', lwd=2)



