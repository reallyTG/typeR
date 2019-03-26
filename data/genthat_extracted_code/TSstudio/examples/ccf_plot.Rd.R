library(TSstudio)


### Name: ccf_plot
### Title: Time Series Cross Correlation Lags Visualization
### Aliases: ccf_plot

### ** Examples


data("USUnRate")
data("USVSales")

ccf_plot(x = USVSales, y = USUnRate)

#Plotting the first 6 lead and lags of the USVSales with the USUnRate
ccf_plot(x = USVSales, y = USUnRate, lags = -6:6)

# Setting the plot margin and number of plots in each raw
ccf_plot(x = USVSales, y = USUnRate, lags = c(0, 6, 12, 24), 
margin = 0.01,  n_plots = 2)



