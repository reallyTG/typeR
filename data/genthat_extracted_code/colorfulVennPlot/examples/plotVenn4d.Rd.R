library(colorfulVennPlot)


### Name: plotVenn4d
### Title: Plot Venn diagram for 4-dimensional data.
### Aliases: plotVenn4d
### Keywords: hplot

### ** Examples


plot.new()
Colors <- c('red', 'yellow', 'green', 'pink', 'darkgreen','blue','lightblue','tan', 
  'yellowgreen','orange','purple','white','grey','plum','brown')
regions <- seq(15)
names(regions) <- c('1000', '0100', '1100', '0010', '1010', '0110', '1110', '0001', 
  '1001', '0101', '1101', '0011', '1011', '0111', '1111')
plotVenn4d(regions, Colors=Colors, Title = '4-dimensional')




