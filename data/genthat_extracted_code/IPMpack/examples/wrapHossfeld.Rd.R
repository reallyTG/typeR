library(IPMpack)


### Name: wrapHossfeld
### Title: Fitting Hossfeld growth function.
### Aliases: wrapHossfeld

### ** Examples


# Simulate data and create a column for growth increment
dff <- generateData()
dff$incr <- dff$sizeNext - dff$size

# Current sum of squares
wrapHossfeld(c(1, 1, 1), dff)

# Use optim to get best parameters values [not run]
tmp <- optim(c(1, 1, 1), wrapHossfeld, dataf = dff, method = "Nelder-Mead")



