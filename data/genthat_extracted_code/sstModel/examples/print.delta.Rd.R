library(sstModel)


### Name: print.delta
### Title: Printing a Delta-Normal Remainder Term
### Aliases: print.delta

### ** Examples

# Creating a new delta.
delta1 <- delta(name        = c("equity", "2YCHF", "EURCHF"),
                currency    = c("EUR", "CHF", "EUR"),
                sensitivity = c(100, 150, 130))
# printing the delta.
print(delta1)




