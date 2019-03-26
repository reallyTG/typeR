## ------------------------------------------------------------------------
library(MortalityGaps)

## ------------------------------------------------------------------------
# Collection of life expectancies for female populations
exF <- MortalityGaps.data$exF
# Life expectancy for male populations
exM <- MortalityGaps.data$exM

head(exF)

## ------------------------------------------------------------------------
M0 <- DoubleGap(DF = exF,
                DM = exM,
                age = 0,
                country = "AUS",
                years = 1950:2014)
M0

## ------------------------------------------------------------------------
summary(M0)

## ------------------------------------------------------------------------
P0 <- predict(M0, h = 36)

## ---- fig.asp = 0.9------------------------------------------------------
plot(P0)

