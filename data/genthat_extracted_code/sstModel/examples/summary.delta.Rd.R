library(sstModel)


### Name: summary.delta
### Title: Summarizing a Delta-Normal Remainder Term
### Aliases: summary.delta

### ** Examples

# Creating a new delta.
delta1 <- delta(name        = c("equity", "2YCHF", "EURCHF"),
                currency    = c("EUR", "CHF", "EUR"),
                sensitivity = c(100, 150, 130))
# summarizing the delta.
summary(delta1)




