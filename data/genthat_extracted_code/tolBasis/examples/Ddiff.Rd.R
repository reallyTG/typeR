library(tolBasis)


### Name: Ddiff
### Title: Date Difference
### Aliases: Ddiff

### ** Examples

# Obtain how many days until the next new year day.
dt1 <- Sys.Date()
dt2 <- Dsucc(dt1, Yearly, 1)
Ddiff(dt1, dt2, Daily)



