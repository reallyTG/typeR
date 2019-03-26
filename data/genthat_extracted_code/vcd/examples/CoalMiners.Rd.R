library(vcd)


### Name: CoalMiners
### Title: Breathlessness and Wheeze in Coal Miners
### Aliases: CoalMiners
### Keywords: datasets

### ** Examples

data("CoalMiners")

ftable(CoalMiners, row.vars = 3)

## Fourfold display, both margins equated
fourfold(CoalMiners[,,2:9], mfcol = c(2,4))

## Fourfold display, strata equated
fourfold(CoalMiners[,,2:9], std = "ind.max", mfcol = c(2,4))


## Log Odds Ratio Plot
lor_CM <- loddsratio(CoalMiners)
summary(lor_CM)
plot(lor_CM)
lor_CM_df <- as.data.frame(lor_CM)

# fit linear models using WLS
age <- seq(20, 60, by = 5)
lmod <- lm(LOR ~ age, weights = 1 / ASE^2, data = lor_CM_df)
grid.lines(age, fitted(lmod), gp = gpar(col = "blue"))
qmod <- lm(LOR ~ poly(age, 2), weights = 1 / ASE^2, data = lor_CM_df)
grid.lines(age, fitted(qmod), gp = gpar(col = "red"))



