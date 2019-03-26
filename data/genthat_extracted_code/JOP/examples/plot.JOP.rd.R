library(JOP)


### Name: plot.JOP
### Title: Displaying the Joint Optimization Plot
### Aliases: plot.JOP

### ** Examples

# Example: Sheet metal hydroforming process
outtest <- JOP(datax = datax, datay = datay, tau = list(0 , 0.05), numbW = 5)

# Several graphical parameters can be plugged in
plot(outtest, col = 5:8)



