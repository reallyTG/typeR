library(s2dverification)


### Name: Season
### Title: Computes Seasonal Means
### Aliases: Season
### Keywords: datagen

### ** Examples

# Load sample data as in Load() example:
example(Load)
leadtimes_dimension <- 4
initial_month <- 11
mean_start_month <- 12
mean_stop_month <- 2
season_means_mod <- Season(sampleData$mod, leadtimes_dimension, initial_month,
                           mean_start_month, mean_stop_month)
season_means_obs <- Season(sampleData$obs, leadtimes_dimension, initial_month,
                           mean_start_month, mean_stop_month)
PlotAno(season_means_mod, season_means_obs, startDates, 
        toptitle = paste('winter (DJF) temperatures'), ytitle = c('K'), 
        legends = 'ERSST', biglab = FALSE, fileout = 'tos_season_means.eps')



