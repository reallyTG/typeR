library(waterfall)


### Name: waterfallchart
### Title: Waterfall Chart
### Aliases: waterfallchart

### ** Examples

data(rasiel)
data(jaquith)
waterfallchart(value~label, data=rasiel, groups=rasiel$subtotal)
waterfallchart(factor~score, data=jaquith)




