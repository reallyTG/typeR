## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----newearthtide--------------------------------------------------------
library(earthtide)

# One month of hourly data
tms <- as.POSIXct("2015-01-01", tz = "UTC") + 0:(24*31) * 3600

et <- Earthtide$new(
  utc = tms,
  latitude = 52.3868,
  longitude = 9.7144,
  wave_groups = data.frame(start = 0.0, end = 6.0))


## ----lodpole, echo = FALSE, fig.width = 6.5, fig.height = 5--------------
tide <-et$lod_tide()$
  pole_tide()$
  tide()


layout(matrix(1:2, ncol=1, nrow = 2))
par(mai = c(0.4, 0.9, 0.1, 0.1))

# Plot the results

plot(lod_tide~datetime, tide,
     xlab = '',
     ylab = expression('LOD tide nm/s' ^ 2),
     type='l',
     lwd = 2,
     col = '#5696BC',
     las = 1)

plot(pole_tide~datetime, tide,
     xlab = '',
     ylab = expression('Pole tide nm/s' ^ 2),
     type='l',
     lwd = 2,
     col = '#5696BC',
     las = 1)


## ----predict-------------------------------------------------------------

et$predict(method = 'gravity', astro_update = 24)


## ----predictplot, fig.width = 6.5, fig.height = 3, fig.ext='png', echo = FALSE----
# Plot the results
par(mai = c(0.6, 0.9, 0.1, 0.1))
plot(gravity~datetime, et$tide(),
     ylab = expression('Gravity nm/s' ^ 2),
     xlab = '',
     type='l',
     lwd = 2,
     col = '#5696BC',
     xaxs = 'i',
     las = 1)

## ----wg, fig.width = 6.5, fig.height = 8, fig.ext='png', echo = TRUE-----
wave_groups <- na.omit(eterna_wavegroups[eterna_wavegroups$time == '1 month', 
                                        c('start', 'end')])

et <- Earthtide$new(utc = tms, 
                    latitude = 49.00937,
                    longitude = 8.40444,
                    elevation = 120,
                    cutoff = 1e-10,
                    catalog = 'hw95s',
                    wave_groups = wave_groups)

print(wave_groups[1:5,], row.names = FALSE)

## ----analyze-------------------------------------------------------------

et$analyze(method = 'gravity', astro_update = 1)


## ----analyzeplot, fig.width = 6.5, fig.height = 8, fig.ext='png', echo = FALSE----

tides <- et$tide()

layout(matrix(1:5, ncol=1, nrow = 5))
par(mai = c(0.3, 0.9, 0.1, 0.1))

for (i in seq(2, 11, 2)) {

  plot(tides[,1], tides[,i],
       ylab = expression('Gravity nm/s' ^ 2),
       xlab = '',
       type = 'l',
       lwd = 2,
       col = '#AAB6A2',
       las = 1)
  points(tides[,1], tides[,i+1],
         type = 'l',
         lwd = 2,
         col  = '#5696BC')

}



## ----r6chain, echo = TRUE------------------------------------------------


tides <- Earthtide$
  new(utc = as.POSIXct("2015-01-01", tz = "UTC") + 0:(24*31) * 3600,
      latitude = 52.3868,
      longitude = 9.7144,
      wave_groups = data.frame(start = 0.0, end = 6.0))$
  predict(method = "gravity", astro_update = 1)$
  lod_tide()$
  pole_tide()$
  tide()
  

print(tides[1:5,], row.names = FALSE)


