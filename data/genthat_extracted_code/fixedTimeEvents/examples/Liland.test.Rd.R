library(fixedTimeEvents)


### Name: Liland.test
### Title: A test for over represented short distances in the Liland
###   distribution.
### Aliases: Liland.test print.Ltest Liland.crit Liland.pow summary.Ltest

### ** Examples

Lt <- Liland.test(12,1,1949,162)
print(Lt)
summary(Lt)

# Critical value
Liland.crit(1, 1949, 162) 

# Power
plot(Liland.pow(1,1949,161, alpha = 0.05), type = 'l', xlab = '#(x<2)', ylab = 'power')



