library(rAmCharts)


### Name: initialize,AmChart-method
### Title: Creates an AmChart
### Aliases: initialize,AmChart-method amChart amAngularGaugeChart
###   amFunnelChart amRadarChart amSerialChart amPieChart amGanttChart
###   amXYChart setAllLabels setAllLabels,AmChart,list-method addLabel
###   addLabel,AmChart,LabelOrMissing-method setArrows
###   setArrows,AmChart-method addArrow
###   addArrow,AmChart,GaugeArrowOrMissing-method setAxes
###   setAxes,AmChart,list-method addAxe
###   addAxe,AmChart,GaugeAxisOrMissing-method addAxis
###   addAxis,AmChart,GaugeAxisOrMissing-method
###   setBalloon,AmChart,AmBalloonOrMissing-method setCategoryAxis
###   setCategoryAxis,AmChart-method setCategoryField
###   setCategoryField,AmChart,character-method setChartCursor
###   setChartCursor,AmChart,ChartCursorOrMissing-method setChartScrollbar
###   setChartScrollbar,AmChart,ChartScrollbarOrMissing-method
###   setCreditsPosition setCreditsPosition,AmChart,character-method
###   setDataLoader setDataLoader,AmChart,character,character-method
###   setDataProvider,AmChart,ANY,logicalOrMissing-method setGraphs
###   setGraphs,AmChart,list-method addGraph
###   addGraph,AmChart,AmGraphOrMissing-method
###   setGraph,AmChart,AmGraphOrMissing-method setGuides
###   setGuides,AmChart,list-method addGuide,AmChart,GuideOrMissing-method
###   setLegend setLegend,AmChart,AmLegendOrMissing-method addSegment
###   addSegment,AmChart,numeric-method addSubData
###   addSubData,AmChart,numeric-method setSubChartProperties
###   setSubChartProperties,AmChart-method setTheme
###   setTheme,AmChart,character-method setTitles
###   setTitles,AmChart,list-method addTitle
###   addTitle,AmChart,TitleOrMissing-method setTrendLines
###   setTrendLines,AmChart,list-method addTrendLine
###   addTrendLine,AmChart,TrendLineOrMissing-method
###   setType,AmChart,character-method setValueAxes
###   setValueAxes,AmChart,list-method addValueAxes
###   addValueAxes,AmChart,ValueAxisOrMissing-method addValueAxis
###   addValueAxis,AmChart,ValueAxisOrMissing-method
###   setValueAxis,AmChart,ValueAxisOrMissing-method setValueScrollbar
###   setValueScrollbar,AmChart,ChartScrollbarOrMissing-method

### ** Examples

new("AmChart", valueField = "value", theme = "patterns")

## No test: 
amChart(type = "pie")
## End(No test)
## No test: 
amAngularGaugeChart()
## End(No test)
## No test: 
amFunnelChart(marginLeft = 15)
## End(No test)
## No test: 
amRadarChart()
## End(No test)
## No test: 
amSerialChart(creditsPostion = "top-right")
## End(No test)
## No test: 
amPieChart()
## End(No test)
## No test: 
amGanttChart(segmentsField = "segments")
## End(No test)
## No test: 
amXYChart()
## End(No test)
## No test: 
allLabels <- list(label(text = "balloonText"), label(text = "column"))
amSerialChart(allLabels = allLabels)
## End(No test)
# ---
## No test: 
addLabel(.Object = amSerialChart(), text = "balloonText")
# equivalent to:
label_obj <- label(text = "balloonText")
addLabel(.Object = amSerialChart(), label = label_obj)
## End(No test)
# ---
## No test: 
arrows_ls <- list(gaugeArrow(value = 130), gaugeArrow(value = 150))
amAngularGaugeChart(arrows = arrows_ls)
## End(No test)
# ---
## No test: 
chart <- addArrow(.Object = amAngularGaugeChart(), value = 10); print(chart)
# equivalent to:
gaugeArrow_obj <- gaugeArrow(value = 10)
addArrow(.Object = amAngularGaugeChart(), arrow = gaugeArrow_obj)
## End(No test)
# ---
## No test: 
axes_ls <- list(gaugeAxis(value = 130), gaugeAxis(value = 150))
setAxes(.Object = amAngularGaugeChart(), axes = axes_ls)
# If possible, simplify your code by using the constructor:
amAngularGaugeChart(axes = axes_ls)
## End(No test)
# ---
## No test: 
addAxis(.Object = amAngularGaugeChart(), startValue = 0, endValue = 100, valueInterval = 10)
# equivalent to:
gaugeAxis_obj <- gaugeAxis(startValue = 0, enValue = 100, valueInterval = 10)
addAxis(.Object = amAngularGaugeChart(), axis = gaugeAxis_obj)
## End(No test)
# ---
## No test: 
setBalloon(.Object = amSerialChart(), adjustBorderColor = TRUE, fillColor = "#FFFFFF",
           color = "#000000", cornerRadius = 5)
# equivalent to:
amBalloon_obj <- amBalloon(adjustBorderColor = TRUE, fillColor = "#FFFFFF",
                           color = "#000000", cornerRadius = 5)
setBalloon(.Object = amSerialChart(), amBalloon = amBalloon_obj)
## End(No test)
# ---
## No test: 
setCategoryAxis(.Object = amSerialChart(), gridPosition = "start")
# equivalent to:
categoryAxis_obj <- categoryAxis(gridPosition = "start")
setCategoryAxis(.Object = amSerialChart(), categoryAxis = categoryAxis_obj)
## End(No test)
# ---
setCategoryField(.Object = amSerialChart(), categoryField = "country")
# ---
## No test: 
# with default value, no argument needed
setChartCursor(.Object = amSerialChart())
# other example
setChartCursor(.Object = amSerialChart(), oneBallOnly = TRUE)
# equivalent to
chartCursor_obj <- chartCursor(oneBallOnly = TRUE)
setChartCursor(.Object = amSerialChart(), chartCursor = chartCursor_obj)
## End(No test)
# ---
## No test: 
# Add the default scrollbar
setChartScrollbar(.Object = amSerialChart())
# equivalent to:
chartScrollbar_obj <- chartScrollbar(updateOnReleaseOnly = FALSE)
setChartScrollbar(.Object = amSerialChart(), chartScrollbar = chartScrollbar_obj)
## End(No test)
# ---
## No test: 
setCreditsPosition(.Object = amPieChart(), creditsPosition = "top-right")
## End(No test)
# ---
## No test: 
setDataLoader(.Object = amSerialChart(), url = "data.json", format = "json")
## End(No test)
# ---
## No test: 
dataProvider_obj <- data.frame(key = c("FR", "US", "GER", "ENG", "IT" ),
                               value = round(runif(5, max = 100)))
setDataProvider(.Object = amPieChart(), dataProvider = dataProvider_obj)
## End(No test)
# ---
## No test: 
graphs_ls <- list(graph(balloonText = "balloonText"), graph(type = "column"))
setGraphs(.Object = amSerialChart(), graphs = graphs_ls)
## End(No test)
# ---
## No test: 
addGraph(.Object = amSerialChart(), balloonText = "balloonText", "type" = "column")
# equivalent to
amGraph_obj <- amGraph(balloonText = "balloonText", "type" = "column")
addGraph(.Object = amSerialChart(), amGraph = amGraph_obj)
## End(No test)
# ---
## No test: 
print(setGraph(.Object = amGanttChart(), id = "amGraph-1"))
# equivalent to:
amGraph_obj <- amGraph(id = "amGraph-1")
setGraph(.Object = amGanttChart(), amGraph = amGraph_obj)
## End(No test)
# ---
## No test: 
guides_ls <- list(guide(fillAlpha = .1), guide(fillAlpha = .5))
amSerialChart(guides = guides_ls)
## End(No test)
# ---
## No test: 
chart <- addGuide(.Object = amSerialChart(), fillAlpha = .1, value = 0, toVAlue = 10)
print(chart)
# equivalent to
guide_obj <- guide(fillAlpha = .1, value = 0, toValue = 10, valueAxis = "1")
addGuide(.Object = amSerialChart(), guide = guide_obj)
## End(No test)
## No test: 
setLegend(.Object = amChart(), amLegend = amLegend(useGraphSettings = TRUE))
# equivalent to:
setLegend(.Object = amChart(), useGraphSettings = TRUE)
## End(No test)
# ---
## No test: 
pipeR::pipeline(
  amGanttChart(segmentsField = "segments"),
  setDataProvider(data.frame(category = c( "John", "Julia"))),
  addSegment(1, data.frame(start = 7, duration = 2:3, task = c("Task #1", "Task #2"))),
  addSegment(2, data.frame(start = 10, duration = 2:3, task = c("Task #1", "Task #2")))
)
# ---
ls <- list(data.frame(start = 7, duration = 2:3, task = c("Task #1", "Task #2")), 
           data.frame(start = 10, duration = 2:3, task = c("Task #1", "Task #2")))
pipeR::pipeline(
  amGanttChart(segmentsField = "segments"),
  setDataProvider(data.frame(category = c( "John", "Julia"))),
  addSegment(1:2,  ls)
)
## End(No test)
# ---
## No test: 
amChart_obj <- amChart(dataProvider = data.frame(a = 1:5, b = 6:10))
addSubData(.Object = amChart_obj, categoryIDs = 3, data = data.frame(a = 1:10, b = 11:20))
## End(No test)
# ---
## No test: 
setSubChartProperties(.Object = amSerialChart(), type = "serial")
## End(No test)
# ---
## No test: 
setTheme(.Object = amPieChart(), theme = "dark")
## End(No test)
# ---
## No test: 
titles_ls <- list(amTitle(text = "balloonText"), amTitle(text = "column"))
setTitles(.Object = amXYChart(), titles = titles_ls)
# or...
amXYChart(titles = titles_ls)
## End(No test)
# ---
## No test: 
addTitle(.Object = amPieChart(), text = "balloonText", size = 15)
# equivalent to
title_obj <- amTitle(text = "balloonText", size = 15)
addTitle(.Object = amPieChart(), title = title_obj)
## End(No test)
# ---
## No test: 
trendLines <- list(trendLine(initialValue = 1, finalValue = 5),
                   trendLine(initialValue = 7, finalValue = 19))
setTrendLines(.Object = amSerialChart(), trendLines = trendLines)
# or... 
amSerialChart(trendLines = trendLines) # Equivalent
## End(No test)
# ---
## No test: 
addTrendLine(.Object = amSerialChart(), initialValue = 1, initialXValue = 1,
             finalValue = 11, finalXValue = 12)
# equivalent to:
trendLine_obj <- trendLine(initialValue = 1, initialXValue = 1, finalValue = 11, finalXValue = 12)
chart <- addTrendLine(.Object = amSerialChart(), trendLine = trendLine_obj); print(chart)
## End(No test)
# ---
## No test: 
setType(.Object = amChart(), type = "pie")
# equivalent to:
amPieChart()
## End(No test)
## No test: 
valueAxes <- list(valueAxis(axisTitleOffset = 12, tickLength = 10),
                  valueAxis(axisTitleOffset = 10, tickLength = 10))
setValueAxes(.Object = amSerialChart(), valueAxes = valueAxes)
# or...
amSerialChart(valueAxes = valueAxes)
## End(No test)
# ---
## No test: 
print(addValueAxis(.Object = amSerialChart(), axisTitleOffset = 12, tickLength = 10, title = "foo"))
# equivalent to:
valueAxis_obj <- valueAxis(axisTitleOffset = 12, tickLength = 10, title = "foo")
addValueAxis(.Object = amSerialChart(), valueAxis = valueAxis_obj)
## End(No test)
# ---
## No test: 
setValueAxis(.Object = amGanttChart())
setValueAxis(.Object = amGanttChart(), type = "date")
## End(No test)
## No test: 
valueScrollbar_obj <- chartScrollbar(updateOnReleaseOnly = FALSE)
chart <- setValueScrollbar(.Object = amSerialChart(), valueScrollbar = valueScrollbar_obj)
print(chart)
# or...
amSerialChart(updateOnReleaseOnly = FALSE)
## End(No test)
# ---



