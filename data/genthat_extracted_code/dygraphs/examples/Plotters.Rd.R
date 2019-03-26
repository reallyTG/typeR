library(dygraphs)


### Name: dyCandlestick
### Title: Employ a dygraph plotter on a series, a group of series, or the
###   whole dygraph
### Aliases: dyCandlestick Plotters dyBarChart dyStackedBarChart
###   dyMultiColumn dyBarSeries dyStemSeries dyShadow dyFilledLine
###   dyErrorFill dyMultiColumnGroup dyCandlestickGroup dyStackedBarGroup
###   dyStackedLineGroup dyStackedRibbonGroup

### ** Examples

## The following two examples will results in the same dygraph:

dygraph(mdeaths) %>% 
  dyBarChart()
 
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>%
  dyMultiColumn()
  

## Per-series plotters:

lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>%
  dyBarSeries('fdeaths')

lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>%
  dyStemSeries('fdeaths')
  
lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>%
  dyShadow('fdeaths')

lungDeaths <- cbind(mdeaths, fdeaths)
dygraph(lungDeaths) %>%
  dyFilledLine('fdeaths')

## A bunch of different plotters together:

lungDeaths <- cbind(fdeaths, mdeaths, ldeaths, foo = fdeaths/2, bar = fdeaths/3)
dygraph(lungDeaths) %>%
  dyRangeSelector() %>%
  dyBarSeries('bar') %>% 
  dyStemSeries('mdeaths') %>% 
  dyShadow('foo') %>% 
  dyFilledLine('fdeaths')

## Group-based plotters:
  

## Candlestick plotters:
  
library(xts)
data(sample_matrix)
library(dygraphs)
dygraph(sample_matrix) %>%
  dyCandlestick()
  
sample<-data.frame(sample_matrix)
sample_2<-sample*2
names(sample_2)<-c('O', 'H', 'L', 'C')
sample<-cbind(sample, sample_2)
dygraph(sample) %>% 
  dyOptions(stackedGraph = TRUE) %>% 
  dyCandlestickGroup(c('Open', 'High', 'Low', 'Close')) %>% 
  dyCandlestickGroup(c('O', 'H', 'L', 'C'))

## Stacked Bar and Ribbon Graphs:  

dygraph(lungDeaths) %>% 
  dySeries('mdeaths', axis = 'y2') %>%
  dyAxis('y', valueRange = c(-100, 1000)) %>% 
  dyStackedBarGroup(c('ldeaths', 'fdeaths'))
  
lungDeaths <- cbind(ldeaths, fdeaths, mdeaths, 
                    additive = rep.int(200, length(ldeaths)),
                    line = rep.int(3000, length(ldeaths)))
dygraph(lungDeaths) %>% 
  dySeries('line', strokePattern = 'dashed') %>% 
  dySeries('ldeaths', stepPlot = TRUE) %>% 
  dyStackedBarGroup(c('additive', 'mdeaths')) %>% 
  dyStackedRibbonGroup(c('fdeaths', 'ldeaths'))



