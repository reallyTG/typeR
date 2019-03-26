library(ggTimeSeries)


### Name: stat_calendar_heatmap
### Title: Plots a calendar heatmap
### Aliases: stat_calendar_heatmap

### ** Examples

{
library(ggplot2)
DailyData = data.frame(
      DateCol = seq(
         as.Date("1/01/2014", "%d/%m/%Y"),
         as.Date("31/12/2015", "%d/%m/%Y"),
         "days"
      ),
      ValueCol = runif(730)
   )
   DailyData$Year = strftime(DailyData$DateCol, "%Y")
ggplot(
   DailyData,
   aes(
      date = DateCol,
      fill = ValueCol
   )
) +
   stat_calendar_heatmap() +
   facet_wrap(~Year, ncol = 1)}



