library(sstModel)


### Name: standalone
### Title: Constructing a Standalone Market Risk
### Aliases: standalone

### ** Examples

# Creating a new standalone.
standalone1 <- standalone(name = "CHF rates",
                          rate(name = "2YCHF", currency = "CHF", horizon = "k"),
                          rate(name = "10YCHF", currency = "CHF", horizon = "m"),
                          rate(name = "10YCHF", currency = "CHF", horizon = "l",
                          scale = 0.75))





