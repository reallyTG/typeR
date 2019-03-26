library(QuantTools)


### Name: plot_ts
### Title: Plot time series !PLEASE USE plot_dts!
### Aliases: plot_ts plot_ts t_to_x

### ** Examples

## No test: 

data( ticks )

time_series = to_candles( ticks, 60 * 10 )

plot_ts( time_series[ time %bw% '2016-05-13', list( time, open, high, low, close ) ] )
plot_ts( time_series[ time %bw% '2016-05-13', list( time, volume = volume / 1e6 )  ] , type = 'h' )
plot_ts( time_series[ time %bw% '2016-05', list( time, close ) ] )
plot_ts( time_series[ , list( time, close ) ] )
## End(No test)
## No test: 

mar = par( 'mar' )
par( mar = c( 0, 4, 0, 4 ), xaxt = 'n' )
layout ( matrix( 1:(3 + 2) ), heights = c( 1, 4, 2, 2, 1 ) )
  empty_plot()
  plot_ts( time_series[ , list( time, open, high, low, close ) ] )
  plot_ts( time_series[ , list( time, close ) ] )
  par( xaxt = 's' )
  plot_ts( time_series[ , list( time, volume = volume / 1e6 ) ], type = 'h' )
  empty_plot()
par( mar = mar )
layout( matrix(1) )
## End(No test)





