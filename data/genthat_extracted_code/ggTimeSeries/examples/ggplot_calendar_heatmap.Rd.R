library(ggTimeSeries)


### Name: ggplot_calendar_heatmap
### Title: Plots a calendar heatmap
### Aliases: ggplot_calendar_heatmap

### ** Examples

{
library(data.table)
library(ggplot2)
set.seed(1)
dtData = data.table(
      DateCol = seq(
         as.Date("1/01/2014", "%d/%m/%Y"),
         as.Date("31/12/2015", "%d/%m/%Y"),
         "days"
      ),
      ValueCol = runif(730)
   )
# you could also try categorical data with
# ValueCol = sample(c('a','b','c'), 730, replace = T)
p1 = ggplot_calendar_heatmap(
   dtData,
   'DateCol',
   'ValueCol'
)
p1
# add new geoms
p1 +
geom_text(label = '!!!') +
scale_colour_continuous(low = 'red', high = 'green')
}



