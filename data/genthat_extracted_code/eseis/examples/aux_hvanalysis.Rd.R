library(eseis)


### Name: aux_hvanalysis
### Title: Perform H-V-spectral ratio analysis of a seismic data set
### Aliases: aux_hvanalysis
### Keywords: eseis

### ** Examples

## load example data set
data(earthquake)

## ATTENTION, THIS EXAMPLE DATA SET IS FAR FROM IDEAL FOR THIS PURPOSE

## detrend data
s <- signal_detrend(data = s)

## calculate the HV ratios straightforward
HV <- aux_hvanalysis(data = s,
                     dt = 1 / 200,
                     kernel = 100)

## calculate the HV ratios with plot output, userdefined palette
plot_col <- colorRampPalette(colors = c("grey", "darkblue", "blue", "orange"))
HV <- aux_hvanalysis(data = s,
                     dt = 1 / 200,
                     kernel = 100,
                     plot = TRUE,
                     col = plot_col(100))

## calculate the HV ratios with optimised method settings
HV <- aux_hvanalysis(data = s, 
                     time = t,
                     dt = 1 / 200, 
                     window = 10, 
                     overlap = 0.9, 
                     method = "autoregressive",
                     plot = TRUE,
                     col = plot_col(100),
                     xlab = "Time (UTC)",
                     ylab = "f (Hz)")
                     
## calculate and plot stack (mean and sd) of all spectral ratios
HV_mean <- apply(X = HV, MARGIN = 1, FUN = mean)
HV_sd <- apply(X = HV, MARGIN = 1, FUN = sd)
HV_f <- as.numeric(rownames(HV))

plot(x = HV_f, y = HV_mean, type = "l", ylim = c(0, 50))
lines(x = HV_f, y = HV_mean + HV_sd, col = 2)
lines(x = HV_f, y = HV_mean - HV_sd, col = 2)              




