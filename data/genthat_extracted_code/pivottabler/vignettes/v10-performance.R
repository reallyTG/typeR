## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()
pt$allTimings
pt$significantTimings

## ---- eval=FALSE---------------------------------------------------------
#  library(pivottabler)
#  pt <- PivotTable$new(evaluationMode="sequential")
#  # or
#  pt <- PivotTable$new(evaluationMode="batch") # the default
#  # ...

## ---- warning=FALSE, comment=""------------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot()
pt$showBatchInfo()

## ---- warning=FALSE, comment=""------------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
highlight1 <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#FFFF00"))
highlight2 <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FFFF"))
highlight3 <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#00FF00"))
highlight4 <- PivotStyle$new(pt, "cellHighlight", list("background-color"="#FF00FF"))
cells1 <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(1, 1), c(1, 2), c(2, 1), c(2, 2), c(3, 1), c(3, 2), c(4, 1), c(4, 2)))
cells2 <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(1, 3), c(2, 3), c(3, 3), c(4, 3)))
cells3 <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(5, 1), c(5, 2)))
cells4 <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(5, 3)))
lst <- lapply(cells1, function(cell) {cell$style <- highlight1})
lst <- lapply(cells2, function(cell) {cell$style <- highlight2})
lst <- lapply(cells3, function(cell) {cell$style <- highlight3})
lst <- lapply(cells4, function(cell) {cell$style <- highlight4})
pt$renderPivot(includeWorkingData = TRUE)
pt$showBatchInfo()

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addColumnDataGroups("PowerType")
pt$addRowDataGroups("TOC", fromData=FALSE, explicitListOfValues=list(
  "London Midland", "CrossCountry", "Other"=c("Arriva Trains Wales", "Virgin Trains")))
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$evaluatePivot()
redStyle <- PivotStyle$new(pt, "redStyle", list("background-color"="#FFC7CE", "color"="#9C0006"))
cells <- pt$getCells(specifyCellsAsList=TRUE, rowNumbers=3)
lst <- lapply(cells, function(cell) {cell$style <- redStyle})
pt$renderPivot(includeWorkingData = TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  library(pivottabler)
#  pt <- PivotTable$new(processingLibrary="dplyr") # the default
#  # or
#  pt <- PivotTable$new(processingLibrary="data.table")
#  # ...

## ---- warning=FALSE, message=FALSE, comment=""---------------------------
library(data.table)
library(pivottabler)
df <- data.frame(SomeNumber=c(1, 1, 1, 2, 2, 2, 3, 3, 3))
pt <- PivotTable$new(processingLibrary="data.table")
pt$addData(df)
pt$addRowDataGroups("SomeNumber")
pt$defineCalculation(calculationName="SomeNumber", summariseExpression="sum(SomeNumber)", caption="Some Number")
pt$evaluatePivot()
pt$renderPivot()

## ---- warning=FALSE, message=FALSE, comment=""---------------------------
library(data.table)
library(pivottabler)
df <- data.frame(SomeNumber=c(1, 1, 1, 2, 2, 2, 3, 3, 3))
pt <- PivotTable$new(processingLibrary="dplyr")
pt$addData(df)
pt$addRowDataGroups("SomeNumber")
pt$defineCalculation(calculationName="SomeNumber", summariseExpression="sum(SomeNumber)", caption="Some Number")
pt$evaluatePivot()
pt$renderPivot()

## ---- warning=FALSE, message=FALSE, comment=""---------------------------
library(data.table)
library(pivottabler)
df <- data.frame(SomeNumberA=c(1, 1, 1, 2, 2, 2, 3, 3, 3), SomeNumberB=c(1, 1, 1, 2, 2, 2, 3, 3, 3))
pt <- PivotTable$new(processingLibrary="data.table")
pt$addData(df)
pt$addRowDataGroups("SomeNumberA")
pt$defineCalculation(calculationName="SomeNumber", summariseExpression="sum(SomeNumberB)", caption="Some Number")
pt$evaluatePivot()
pt$renderPivot()

## ---- eval=FALSE---------------------------------------------------------
#  library(pivottabler)
#  pt <- PivotTable$new(argumentCheckMode="none")
#  # ...

## ---- eval=FALSE---------------------------------------------------------
#  benchmarkScenarios <- function() {
#    iterationCount <- 3
#    evaluationModes <- c("sequential", "batch")
#    rowCounts <- c(1e5, 1e6, 1e7)
#    cellCounts <- c(10, 100, 1e3)
#    argumentCheckModes <- c("none", "balanced")
#    processingLibraries <- c("dplyr", "data.table")
#    testCount <- length(evaluationModes) * length(rowCounts) * length(cellCounts) *
#      length(argumentCheckModes) * length(processingLibraries) * iterationCount
#    c0 <- 1:testCount
#    c1 <- character(testCount)
#    c2 <- integer(testCount)
#    c3 <- integer(testCount)
#    c4 <- character(testCount)
#    c5 <- character(testCount)
#    c6 <- character(testCount)
#    completed <- logical(testCount)
#    userTime <- numeric(testCount)
#    systemTime <- numeric(testCount)
#    elapsedTime <- numeric(testCount)
#    testCount <- 0
#    for(i in 1:iterationCount)
#      for(evaluationMode in evaluationModes)
#        for(rowCount in rowCounts)
#          for(cellCount in cellCounts)
#            for(argumentCheckMode in argumentCheckModes)
#              for(processingLibrary in processingLibraries) {
#                testCount <- testCount + 1
#                c1[testCount] <- evaluationMode
#                c2[testCount] <- rowCount
#                c3[testCount] <- cellCount
#                c4[testCount] <- argumentCheckMode
#                c5[testCount] <- processingLibrary
#                c6[testCount] <- paste0(rowCount, " rows x ", cellCount, " cells ",
#                                        evaluationMode, " ", processingLibrary,
#                                        " ", argumentCheckMode)
#              }
#    df <- data.frame(id=c0, evaluationMode=c1, rowCount=c2, cellCount=c3, argumentCheckMode=c4,
#                     processingLibrary=c5, description=c6, completed=completed,
#                     userTime=userTime, systemTime=systemTime, elapsedTime=elapsedTime,
#                     stringsAsFactors=FALSE)
#    return(df)
#  }
#  
#  generateDataFrame <- function(cellCount, rowCount) {
#    a <- 0
#    b <- 0
#    repCount <- 0
#    if(cellCount==10) {
#      a <- 5
#      b <- 2
#    }
#    else if(cellCount==100) {
#      a <- 10
#      b <- 10
#    }
#    else if(cellCount==1000) {
#      a <- 50
#      b <- 20
#    }
#    else if(cellCount==10000) {
#      a <- 100
#      b <- 100
#    }
#    else if(cellCount==100000) {
#      a <- 500
#      b <- 200
#    }
#    else stop("Invalid cellCount specified.")
#    x <- integer(a * b)
#    y <- integer(a * b)
#    n <- 0
#    for(i in 1:a)
#      for(j in 1:b) {
#        n <- n + 1
#        x[n] <- i
#        y[n] <- j
#      }
#    repCount <- ceiling(rowCount / length(x))
#    x <- rep.int(x, repCount)
#    y <- rep.int(y, repCount)
#    if(length(x)>rowCount) x <- x[1:rowCount]
#    if(length(y)>rowCount) y <- y[1:rowCount]
#    df <- data.frame(x, y)
#    return(df)
#  }
#  
#  scenarios <- benchmarkScenarios()
#  testData <- list()
#  
#  for(s in 1:nrow(scenarios)) {
#    evaluationMode <- scenarios$evaluationMode[s]
#    rowCount <- scenarios$rowCount[s]
#    cellCount <- scenarios$cellCount[s]
#    argumentCheckMode <- scenarios$argumentCheckMode[s]
#    processingLibrary <- scenarios$processingLibrary[s]
#    countFunction <- ifelse(processingLibrary=="data.table", ".N", "n()")
#    description <- scenarios$description[s]
#  
#    message("---------------------------------------------")
#    message(paste("Test ", s, " out of ", nrow(scenarios)))
#  
#    df <- testData[[paste0(cellCount, "-", rowCount)]]
#    if(is.null(df)) {
#      df <- generateDataFrame(cellCount=cellCount, rowCount=rowCount)
#      testData[[paste0(cellCount, "-", rowCount)]] <- df
#    }
#    xmax <- max(df$x)
#    ymax <- max(df$y)
#    if((xmax*ymax)!=cellCount) stop("cellCount error!")
#  
#    message(paste0("Starting ", description))
#  
#    time <- system.time({
#      library(pivottabler)
#      pt <- PivotTable$new(processingLibrary=processingLibrary, evaluationMode=evaluationMode,
#                           argumentCheckMode=argumentCheckMode)
#      pt$addData(df)
#      pt$addColumnDataGroups("x")
#      pt$addRowDataGroups("y")
#      pt$defineCalculation(calculationName="rowCount", summariseExpression=countFunction)
#      pt$evaluatePivot()
#      html <- pt$getHtml()
#    })
#  
#    message(paste0("Completed ", description, " in ", round(time["elapsed"], 2), " second(s)"))
#  
#    scenarios$completed[s] <- TRUE
#    scenarios$userTime[s] <- time["user.self"]
#    scenarios$systemTime[s] <- time["sys.self"]
#    scenarios$elapsedTime[s] <- time["elapsed"]
#  
#    write.table(scenarios, file="D:\\R\\benchmark.txt", quote=F, sep="\t", row.names=F)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  results <- read.table(file="D:\\R\\benchmark.txt", sep="\t", header=TRUE)
#  scenarios <- results %>%
#    filter(argumentCheckMode=="none") %>%
#    group_by(evaluationMode, rowCount, cellCount, argumentCheckMode, processingLibrary,
#             description) %>%
#    summarise(id=min(id), userTimeAvg=mean(userTime), systemTimeAvg=mean(systemTime),
#              elapsedTimeAvg=mean(elapsedTime),
#              userTimeMin=min(userTime), userTimeMax=max(userTime),
#              systemTimeMin=min(systemTime), systemTimeMax=max(systemTime),
#              elapsedTimeMin=min(elapsedTime), elapsedTimeMax=max(elapsedTime)) %>%
#    select(id, evaluationMode, rowCount, cellCount, argumentCheckMode, processingLibrary,
#           description, userTimeAvg, systemTimeAvg, elapsedTimeAvg, userTimeMin, userTimeMax,
#           systemTimeMin, systemTimeMax, elapsedTimeMin, elapsedTimeMax) %>%
#    ungroup() %>%
#    mutate(testName=paste0(evaluationMode, " ", processingLibrary)) %>%
#    arrange(rowCount, cellCount, testName) %>%
#    group_by(rowCount, cellCount) %>%
#    mutate(testIndex=row_number()) %>%
#    ungroup()

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  summarydata <- mutate(scenarios,
#                     cellDesc=paste0(cellCount, "  cells"),
#                     rowDesc=paste0(
#                       recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"),
#                       "M  data frame rows")
#  )
#  library(pivottabler)
#  pt <- PivotTable$new()
#  pt$addData(summarydata)
#  pt$addColumnDataGroups("evaluationMode", addTotal=FALSE)
#  pt$addColumnDataGroups("processingLibrary", addTotal=FALSE)
#  pt$addRowDataGroups("rowDesc", addTotal=FALSE)
#  pt$addRowDataGroups("cellDesc", addTotal=FALSE)
#  pt$defineCalculation(calculationName="elapsedTimeAvg", type="value", valueName="elapsedTimeAvg", format="%.2f")
#  pt$evaluatePivot()
#  greenStyle <- PivotStyle$new(pt, "greenStyle", list("background-color"="#C6EFCE", "color"="#006100"))
#  yellowStyle <- PivotStyle$new(pt, "yellowStyle", list("background-color"="#FFEB9C", "color"="#9C5700"))
#  redStyle <- PivotStyle$new(pt, "redStyle", list("background-color"="#FFC7CE", "color"="#9C0006"))
#  cells <- pt$findCells(minValue=0, maxValue=2, includeNull=FALSE, includeNA=FALSE)
#  cellCount <- lapply(cells, function(cell) {cell$style <- greenStyle})
#  cells <- pt$findCells(minValue=2, maxValue=15, includeNull=FALSE, includeNA=FALSE)
#  cellCount <- lapply(cells, function(cell) {cell$style <- yellowStyle})
#  cells <- pt$findCells(minValue=15, includeNull=FALSE, includeNA=FALSE)
#  cellCount <- lapply(cells, function(cell) {cell$style <- redStyle})
#  pt$renderPivot()

## ---- message=FALSE, warning=FALSE, echo=FALSE---------------------------
library(dplyr)
summarydata <- mutate(pvtperfsummary, 
                   cellDesc=paste0(cellCount, "  cells"), 
                   rowDesc=paste0(
                     recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"), 
                     "M  data frame rows")
)
library(pivottabler)
pt <- PivotTable$new()
pt$addData(summarydata)
pt$addColumnDataGroups("evaluationMode", addTotal=FALSE)
pt$addColumnDataGroups("processingLibrary", addTotal=FALSE)
pt$addRowDataGroups("rowDesc", addTotal=FALSE)
pt$addRowDataGroups("cellDesc", addTotal=FALSE)
pt$defineCalculation(calculationName="elapsedTimeAvg", type="value", valueName="elapsedTimeAvg", format="%.2f")
pt$evaluatePivot()
greenStyle <- PivotStyle$new(pt, "greenStyle", list("background-color"="#C6EFCE", "color"="#006100"))
yellowStyle <- PivotStyle$new(pt, "yellowStyle", list("background-color"="#FFEB9C", "color"="#9C5700"))
redStyle <- PivotStyle$new(pt, "redStyle", list("background-color"="#FFC7CE", "color"="#9C0006"))
cells <- pt$findCells(minValue=0, maxValue=2, includeNull=FALSE, includeNA=FALSE)
cellCount <- lapply(cells, function(cell) {cell$style <- greenStyle})
cells <- pt$findCells(minValue=2, maxValue=15, includeNull=FALSE, includeNA=FALSE)
cellCount <- lapply(cells, function(cell) {cell$style <- yellowStyle})
cells <- pt$findCells(minValue=15, includeNull=FALSE, includeNA=FALSE)
cellCount <- lapply(cells, function(cell) {cell$style <- redStyle})
pt$renderPivot()

## ---- eval=FALSE---------------------------------------------------------
#  # clearer captions
#  library(dplyr)
#  plotdata <- mutate(scenarios,
#                     cellDesc=paste0(cellCount, "  cells"),
#                     rowDesc=paste0(
#                       recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"),
#                       "M  data frame rows")
#                     )
#  
#  # plot using ggplot2
#  library(ggplot2)
#  colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")
#  
#  # bar chart
#  ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
#    geom_bar(aes(fill=testName), stat="identity", position="dodge") +
#    scale_fill_manual(values=colors, name="Test") +
#    theme(panel.background = element_rect(colour = "grey40", fill = "white"),
#          panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
#          axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
#    scale_y_continuous(expand = c(0.01, 0)) +
#    coord_cartesian(ylim = c(0, 680)) +
#    labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
#    facet_grid(cellDesc ~ rowDesc)
#  

## ---- message=FALSE, warning=FALSE, echo=FALSE, fig.width=7, fig.height=4----
# clearer captions
library(dplyr)
plotdata <- mutate(pvtperfsummary, 
                   cellDesc=paste0(cellCount, "  cells"), 
                   rowDesc=paste0(
                     recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"), 
                     "M  data frame rows")
                   )
# plot
library(ggplot2)
library(pivottabler)
colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")

ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
  geom_bar(aes(fill=testName), stat="identity", position="dodge") +
  scale_fill_manual(values=colors, name="Test") +
  theme(panel.background = element_rect(colour = "grey40", fill = "white"),
        panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
        axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
  scale_y_continuous(expand = c(0.01, 0)) +
  coord_cartesian(ylim = c(0, 680)) +
  labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
  facet_grid(cellDesc ~ rowDesc)

## ---- eval=FALSE---------------------------------------------------------
#  # clearer captions
#  library(dplyr)
#  plotdata <- mutate(scenarios,
#                     cellDesc=paste0(cellCount, "  cells"),
#                     rowDesc=paste0(
#                       recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"),
#                       "M  data frame rows")
#                     )
#  # plot
#  library(ggplot2)
#  colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")
#  
#  ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
#    geom_bar(aes(fill=testName), stat="identity", position="dodge") +
#    scale_fill_manual(values=colors, name="Test") +
#    theme(panel.background = element_rect(colour = "grey40", fill = "white"),
#          panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
#          axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
#    scale_y_continuous(expand = c(0.01, 0)) +
#    coord_cartesian(ylim = c(0, 84)) +
#    labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
#    facet_grid(cellDesc ~ rowDesc)

## ---- message=FALSE, warning=FALSE, echo=FALSE, fig.width=7, fig.height=4----
# clearer captions
library(dplyr)
plotdata <- mutate(pvtperfsummary, 
                   cellDesc=paste0(cellCount, "  cells"), 
                   rowDesc=paste0(
                     recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"), 
                     "M  data frame rows")
                   )
# plot
library(ggplot2)
library(pivottabler)
colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")

ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
  geom_bar(aes(fill=testName), stat="identity", position="dodge") +
  scale_fill_manual(values=colors, name="Test") +
  theme(panel.background = element_rect(colour = "grey40", fill = "white"),
        panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
        axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
  scale_y_continuous(expand = c(0.01, 0)) +
  coord_cartesian(ylim = c(0, 84)) +
  labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
  facet_grid(cellDesc ~ rowDesc)

## ---- eval=FALSE---------------------------------------------------------
#  # clearer captions
#  library(dplyr)
#  plotdata <- mutate(scenarios,
#                     cellDesc=paste0(cellCount, "  cells"),
#                     rowDesc=paste0(
#                       recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"),
#                       "M  data frame rows")
#                     )
#  # plot
#  library(ggplot2)
#  colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")
#  
#  ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
#    geom_bar(aes(fill=testName), stat="identity", position="dodge") +
#    scale_fill_manual(values=colors, name="Test") +
#    theme(panel.background = element_rect(colour = "grey40", fill = "white"),
#          panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
#          axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
#    scale_y_continuous(expand = c(0.01, 0)) +
#    coord_cartesian(ylim = c(0, 14)) +
#    labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
#    facet_grid(cellDesc ~ rowDesc)

## ---- message=FALSE, warning=FALSE, echo=FALSE, fig.width=7, fig.height=4----
# clearer captions
library(dplyr)
plotdata <- mutate(pvtperfsummary, 
                   cellDesc=paste0(cellCount, "  cells"), 
                   rowDesc=paste0(
                     recode(rowCount, "1e5"=" 0.1", "1e6"=" 1", "1e7"="10"), 
                     "M  data frame rows")
                   )
# plot
library(ggplot2)
library(pivottabler)
colors <- c("#A5E9A5","#33CC33", "#99CCFF","#0066FF")

ggplot(plotdata, aes(x = testName, y = elapsedTimeAvg)) +
  geom_bar(aes(fill=testName), stat="identity", position="dodge") +
  scale_fill_manual(values=colors, name="Test") +
  theme(panel.background = element_rect(colour = "grey40", fill = "white"),
        panel.grid.major = element_line(colour = rgb(0.85, 0.85, 0.85)),
        axis.ticks.x=element_blank(), axis.text.x=element_blank()) +
  scale_y_continuous(expand = c(0.01, 0)) +
  coord_cartesian(ylim = c(0, 14)) +
  labs(x = "Test", y = "Elapsed Time (seconds)", title ="Performance Comparison") +
  facet_grid(cellDesc ~ rowDesc)

