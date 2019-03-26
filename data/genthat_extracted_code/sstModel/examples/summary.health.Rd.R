library(sstModel)


### Name: summary.health
### Title: Summarizing a Health Delta-Normal Term
### Aliases: summary.health

### ** Examples

# Creating a new health item.
health1 <- health(name        = c("pandemy", "longetivity", "storno"),
                  currency    = c("EUR", "CHF", "EUR"),
                  sensitivity = c(100, 150, 130))
# summarizing the health item.
summary(health1)




