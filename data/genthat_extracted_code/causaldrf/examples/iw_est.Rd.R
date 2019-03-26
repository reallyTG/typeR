library(causaldrf)


### Name: iw_est
### Title: The inverse weighting estimator (nonparametric method)
### Aliases: iw_est

### ** Examples

## Example from Schafer (2015).

example_data <- sim_data

iw_list <- iw_est(Y = Y,
                treat = T,
                treat_formula = T ~ B.1 + B.2 + B.3 + B.4 + B.5 + B.6 + B.7 + B.8,
                data = example_data,
                grid_val = seq(8, 16, by = 1),
                bandw = bw.SJ(example_data$T),
                treat_mod = "Normal")

sample_index <- sample(1:1000, 100)

plot(example_data$T[sample_index],
      example_data$Y[sample_index],
      xlab = "T",
      ylab = "Y",
      main = "iw estimate")

lines(seq(8, 16, by = 1),
        iw_list$param,
        lty = 2,
        lwd = 2,
        col = "blue")

legend('bottomright',
        "iw estimate",
        lty=2,
        lwd = 2,
        col = "blue",
        bty='Y',
        cex=1)

rm(example_data, iw_list, sample_index)

## Example from Imai & van Dyk (2004).

data("nmes_data")
head(nmes_data)
# look at only people with medical expenditures greater than 0
nmes_nonzero <- nmes_data[which(nmes_data$TOTALEXP > 0), ]


iw_list <- iw_est(Y = TOTALEXP,
                  treat = packyears,
                  treat_formula = packyears ~ LASTAGE + I(LASTAGE^2) +
                    AGESMOKE + I(AGESMOKE^2) + MALE + RACE3 + beltuse +
                    educate + marital + SREGION + POVSTALB,
                  data = nmes_nonzero,
                  grid_val = seq(5, 100, by = 5),
                  bandw = bw.SJ(nmes_nonzero$packyears),
                  treat_mod = "LogNormal")

set.seed(307)
sample_index <- sample(1:nrow(nmes_nonzero), 1000)

plot(nmes_nonzero$packyears[sample_index],
     nmes_nonzero$TOTALEXP[sample_index],
     xlab = "packyears",
     ylab = "TOTALEXP",
     main = "iw estimate",
     ylim = c(0, 10000),
     xlim = c(0, 100))

lines(seq(5, 100, by = 5),
      iw_list$param,
      lty = 2,
      lwd = 2,
      col = "blue")

legend('topright',
       "iw estimate",
       lty=2,
       lwd = 2,
       col = "blue",
       bty='Y',
       cex = 1)
abline(0, 0)



