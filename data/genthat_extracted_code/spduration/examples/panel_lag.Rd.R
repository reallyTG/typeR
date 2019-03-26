library(spduration)


### Name: panel_lag
### Title: Lag panel data
### Aliases: panel_lag

### ** Examples

data(coups)
# No need to order before using panelLag, just do it here so we can compare results below.
coups <- coups[order(coups$gwcode, coups$year), ]
test <- panel_lag("polity2", "gwcode", "year", data=coups)

# Compare output
head(coups$polity2)
head(test)




