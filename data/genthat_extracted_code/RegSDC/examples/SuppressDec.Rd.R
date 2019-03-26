library(RegSDC)


### Name: SuppressDec
### Title: Suppressed tabular data: Inner cell frequencies as decimal
###   numbers
### Aliases: SuppressDec

### ** Examples

# Same data as in the paper
z <- RegSDCdata("sec7z")
x <- RegSDCdata("sec7x")
y <- RegSDCdata("sec7y")  # Now z is t(x) %*% y 
zAll <- RegSDCdata("sec7zAll")
zAllSupp <- RegSDCdata("sec7zAllSupp")
xAll <- RegSDCdata("sec7xAll")

# When no suppression, output is identical to y
SuppressDec(xAll, zAll, y)
SuppressDec(xAll, zAll)  # y can be seen in z

# Similar to Y* in paper (but other random values)
SuppressDec(x, z, y)

# Residual standard error forced to be 1
SuppressDec(x, z, y, rmse = 1)

# Seven ways of obtaining the same output
SuppressDec(x, z, rmse = 1)  # slower, y must be estimated
SuppressDec(x, y = y, rmse = 1)
SuppressDec(xAll, zAllSupp, y, rmse = 1)
SuppressDec(xAll, zAllSupp, rmse = 1)  # slower, y must be estimated
SuppressDec(xAll, zAll, y, is.na(zAllSupp), rmse = 1)
SuppressDec(xAll, zAll, suppressed = is.na(zAllSupp), rmse = 1)  # y seen in z
SuppressDec(xAll, y = y, suppressed = is.na(zAllSupp), rmse = 1)

# YhatMod4 and YhatMod10 in Table 2 in paper
SuppressDec(xAll, zAllSupp, y, yDeduct = 4 * (y%/%4), resScale = 0)
SuppressDec(xAll, zAllSupp, y, yDeduct = 10 * (y%/%10), rmse = 0)

# As data in Table 3 in paper (but other random values)
SuppressDec(xAll, zAllSupp, y, yDeduct = 10 * (y%/%10), resScale = 0.1)

# rmse instead of resScale and 5 draws
SuppressDec(xAll, zAllSupp, y, yDeduct = 10 * (y%/%10), rmse = 1, nRep = 5)



