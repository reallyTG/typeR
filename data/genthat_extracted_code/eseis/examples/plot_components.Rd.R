library(eseis)


### Name: plot_components
### Title: Plot three seismic components against each other
### Aliases: plot_components
### Keywords: eseis

### ** Examples


## load example data set
data(earthquake)

## filter seismic signals
s <- eseis::signal_filter(data = s, 
                          dt = 1/200, 
                          f = c(0.05, 0.1))

## integrate signals to get displacement
s_d <- eseis::signal_integrate(data = s, dt = 1/200)

## plot components in 2D
plot_components(data = s_d, 
                type = "2D")

## plot components with time colour-coded
plot_components(data = s_d, 
                type = "2D",
                col = rainbow(n = length(s$BHE)))

## plot components with used defined coulour ramp
col_user <- colorRampPalette(colors = c("grey20", "darkblue", "blue", 
                                        "green", "red", "orange"))

plot_components(data = s_d, 
                type = "2D",
                col = col_user(n = length(s$BHE)))

## plot components as 3D plot
plot_components(data = s_d, 
                type = "3D",
                col = rainbow(n = length(s$BHE)))
                



