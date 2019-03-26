## ------------------------------------------------------------------------
library(TSrepr)
library(ggplot2)

## ---- fig.height=3.5, fig.width=7----------------------------------------
data("elec_load")

data_ts <- as.numeric(elec_load[1,])

ggplot(data.frame(Time = 1:length(data_ts), Value = data_ts), aes(Time, Value)) +
  geom_line() +
  theme_bw()

## ------------------------------------------------------------------------
# DWT with level of 2^3
data_dwt <- repr_dwt(data_ts, level = 3)
# first 84 DFT coefficients are extracted and then inverted
data_dft <- repr_dft(data_ts, coef = 84)
# first 84 DCT coefficients are extracted and then inverted
data_dct <- repr_dct(data_ts, coef = 84)
# Classical PAA
data_paa <- repr_paa(data_ts, q = 8, func = mean)

## ---- fig.height=3.5, fig.width=7----------------------------------------
data_plot <- data.frame(Value = c(data_dwt, data_dft, data_dct, data_paa),
                        Time = rep(1:length(data_dwt), 4),
                        Method = factor(rep(c("DWT", "DFT", "DCT", "PAA"),
                                            each = length(data_dwt))))

ggplot(data_plot, aes(Time, Value, color = Method)) +
  geom_line(alpha = 0.80, size = 0.8) +
  theme_bw()

## ------------------------------------------------------------------------
data_lm <- repr_lm(data_ts, freq = 48, method = "lm")
# robust linear model and l1 regression are also implemented
data_l1 <- repr_lm(data_ts, freq = 48, method = "l1")
# GAM
data_gam <- repr_gam(data_ts, freq = 48)
# median seasonal profile
data_seas_prof <- repr_seas_profile(data_ts, freq = 48, func = median)
# exponential smoothing
data_exp <- repr_exp(data_ts, freq = 48)

## ---- fig.height=4, fig.width=7------------------------------------------
data_plot <- data.frame(Value = c(data_lm, data_l1, data_seas_prof, data_exp, data_gam),
                        Time = c(rep(1:length(data_lm), 4), 1:length(data_gam)),
                        Method = c(rep(c("LM", "L1", "Median seas. prof.", "Exp. smooth."),
                                       each = 48), rep("GAM", 47)))

ggplot(data_plot, aes(Time, Value, color = Method)) +
  geom_line(alpha = 0.80, size = 0.8) +
  theme_bw()

## ------------------------------------------------------------------------
data_pip <- repr_pip(data_ts, times = 60, return = "both")
data_pla <- repr_pla(data_ts, times = 60, return = "both")

## ---- fig.height=4, fig.width=7------------------------------------------
data_plot <- data.frame(Value = c(data_ts, data_pip$points, data_pla$points),
                        Time = c(1:length(data_ts), data_pip$places, data_pla$places),
                        Method = c(rep("Original", length(data_ts)),
                                   rep(c("PIP", "PLA"), each = length(data_pla$places))))

ggplot(data_plot, aes(Time, Value, color = Method)) +
  geom_line(alpha = 0.65, size = 0.8) +
  theme_bw()

## ------------------------------------------------------------------------
# aggregates of size 12 and alphabet of size 10
repr_sax(data_ts, q = 12, a = 10)

## ------------------------------------------------------------------------
data_oneday <- data_ts[1:48]
clipping(data_oneday)

## ---- fig.height=3.5, fig.width=7----------------------------------------
ggplot(data.frame(Time = 1:length(data_oneday), Value = data_oneday), aes(Time, Value)) +
  geom_line() +
  geom_line(data = data.frame(Time = 1:length(data_oneday), Value = mean(data_oneday)), aes(Time, Value), color = "red", size = 1, alpha = 0.8) +
  theme_bw()

## ------------------------------------------------------------------------
rleC(clipping(data_oneday))

## ------------------------------------------------------------------------
repr_feaclip(data_oneday)

## ---- fig.height=4, fig.width=7------------------------------------------
data_feaclip <- repr_windowing(data_ts, func = repr_feaclip, win_size = 48)

ggplot(data.frame(Time = 1:length(data_feaclip), Value = data_feaclip), aes(Time, Value)) +
  geom_line() +
  theme_bw()

## ------------------------------------------------------------------------
# original time series
rleC(trending(data_oneday))
# smoothed time series by SMA
rleC(trending(repr_sma(data_oneday, order = 4)))

## ---- fig.height=3.5, fig.width=7----------------------------------------
# visualize smoothed time series
data_sma <- repr_sma(data_ts, order = 48*7)
ggplot(data.frame(Time = 1:length(data_sma), Value = data_sma), aes(Time, Value)) +
  geom_line() +
  theme_bw()

# compute FeaTrend representation
repr_featrend(data_ts, func = max, pieces = 1, order = 48*7)

