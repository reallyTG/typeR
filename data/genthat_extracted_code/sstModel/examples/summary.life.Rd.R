library(sstModel)


### Name: summary.life
### Title: Summarizing a Life Delta-Normal Remainder Term
### Aliases: summary.life

### ** Examples

# Creating a new life item.
life1 <-   life(name        = c("pandemy", "longetivity", "storno"),
                currency    = c("EUR", "CHF", "EUR"),
                sensitivity = c(100, 150, 130))
# summarizing the life item.
summary(life1)




