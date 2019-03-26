library(sstModel)


### Name: rate
### Title: Constructing a Rate (Risk Factor)
### Aliases: rate

### ** Examples

# constructing a non-scaled rate risk factor
# (assuming "2Y_CHF" exists in marketRisk).
r <- rate(name     = "2Y_CHF",
          currency = "CHF",
          horizon  = "k")

# constructing a scaled rate risk factor
# (assuming "2Y_CHF" exists in marketRisk).
r <- rate(name     = "2Y_CHF",
          currency = "CHF",
          horizon  = "k",
          scale    = 0.5)

# constructing a rate risk factor from principal component
 r <- rate(name     = c("pcRate_EUR_1",
                        "pcRate_EUR_2",
                        "pcRate_EUR_3"),
           currency = "EUR",
           horizon  = "k",
           scale    = c(0.3, -0.2, sqrt(1-(0.3^2)-((-0.2)^2))))




