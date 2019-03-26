library(funnelR)


### Name: funplot
### Title: Create a funnel plot
### Aliases: funplot

### ** Examples

#My sample data
my_data  <- data.frame(id=c('A','B','C','D','E'), n=c(2,5,10,15,18), d=c(20,20,20,20,20))

#Process sample data through fundata
my_fpdata <- fundata(my_data, alpha=0.95, alpha2=0.998, method='approximate', step=0.5)

#Use sample data and fundata to make the plot.
my_plot <- funplot(my_data, my_fpdata)

#View plot
my_plot



