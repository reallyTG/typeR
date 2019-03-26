library(ggseas)


### Name: stat_decomp
### Title: Classical seasonal adjustment Stat
### Aliases: stat_decomp

### ** Examples

ap_df <- tsdf(AirPassengers)

# Default additive decomposition (doesn't work well in this case!):
ggplot(ap_df, aes(x = x, y = y)) +
   stat_decomp()

# Multiplicative decomposition, more appropriate:
ggplot(ap_df, aes(x = x, y = y)) +
   stat_decomp(type = "multiplicative")

# Multiple time series example:
ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
  geom_point() +
  facet_wrap(~sex) +
  stat_decomp() +
  ggtitle("Seasonally adjusted lung deaths")

# Example using index:
ggplot(ldeaths_df, aes(x = YearMon, y = deaths, colour = sex)) +
  facet_wrap(~sex) +
  stat_decomp(index.ref = 1:12, index.basis = 1000) +
  ggtitle("Rolling annual median lung deaths, indexed (average month in 1974 = 1000)")




