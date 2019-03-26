## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  pivotStyles$addStyle(styleName="ColumnHeader", list(
#      "font-family"="arial",
#      "font-size"="0.75em",
#      padding="2px",
#      border="1px solid blue",
#      "vertical-align"="middle",
#      "text-align"="center",
#      "font-weight"="bold",
#      color="blue",
#      "background-color"="#FFFFFF",
#      "xl-wrap-text"="wrap"
#    ))

## ---- message=FALSE, warning=FALSE---------------------------------------
# basic theme
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$theme <- "default"  # this theme is already the default, so this line isn't really needed
pt$renderPivot(styleNamePrefix="t0")

## ---- message=FALSE, warning=FALSE---------------------------------------
# compact theme
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$theme <- "compact"
pt$renderPivot(styleNamePrefix="t1")

## ---- message=FALSE, warning=FALSE---------------------------------------
# large plain theme
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$theme <- "largeplain"
pt$renderPivot(styleNamePrefix="t2")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
blue1Colors <- list(
  headerBackgroundColor = "rgb(68, 114, 196)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(186, 202, 233)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(48, 84, 150)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=blue1Colors, fontName="Verdana, Arial")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t3")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
grayColors <- list(
  headerBackgroundColor = "rgb(128, 128, 128)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(192, 192, 192)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(64, 64, 64)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=grayColors, fontName="Courier New, Courier")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t4")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
orangeColors <- list(
  headerBackgroundColor = "rgb(237, 125, 49)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(248, 198, 165)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(198, 89, 17)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=orangeColors, fontName="Garamond, arial")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t5")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
greenColors <- list(
  headerBackgroundColor = "rgb(112, 173, 71)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor="rgb(255, 255, 255)",
  cellColor="rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(182, 216, 158)",
  totalColor="rgb(0, 0, 0)",
  borderColor = "rgb(84, 130, 53)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=greenColors, fontName="Helvetica, arial")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t6")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
yellowColors <- list(
  headerBackgroundColor = "rgb(255, 192, 0)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor="rgb(255, 255, 255)",
  cellColor="rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(255, 242, 204)",
  totalColor="rgb(0, 0, 0)",
  borderColor = "rgb(255, 192, 0)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=yellowColors, fontName="Verdana")
pt$theme <- theme
pt$renderPivot(styleNamePrefix="t7")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the theme and styles
createCustomTheme <- function(parentPivot=NULL, themeName="myCustomTheme") {
  pivotStyles <- PivotStyles$new(parentPivot=parentPivot, themeName=themeName)
  # borders in purple
  pivotStyles$addStyle(styleName="Table", list(
      "border-collapse"="collapse",
      "border"="2px solid #B28DFF"
    ))
  # column headings in pink
  pivotStyles$addStyle(styleName="ColumnHeader", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      "font-weight"="bold",
      padding="2px",
      "border"="2px solid #B28DFF",
      "vertical-align"="middle",
      "text-align"="center",
      "font-weight"="bold",
      color="#DB49AC",
      "background-color"="#FFCCF9",
      "xl-wrap-text"="wrap"
    ))
  # row headings in blue
  pivotStyles$addStyle(styleName="RowHeader", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      "font-weight"="bold",
      padding="2px 8px 2px 2px",
      "border"="1px solid #B28DFF",
      "vertical-align"="middle",
      "text-align"="left",
      "font-weight"="bold",
      color="#438EC8",
      "background-color"="#ACE7FF",
      "xl-wrap-text"="wrap"
    ))
  # cells in yellow
  pivotStyles$addStyle(styleName="Cell", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      padding="2px 2px 2px 8px",
      "border"="1px solid #B28DFF",
      "text-align"="right",
      color="#FF800D",
      "background-color"="#FFFFD1"
    ))
  # totals in orange
  pivotStyles$addStyle(styleName="Total", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      "font-weight"="bold",
      padding="2px 2px 2px 8px",
      "border"="1px solid rgb(84, 130, 53)",
      "text-align"="right",
      color="#3BC6B6",
      "background-color"="#BFFCC6"
    ))
  pivotStyles$tableStyle <- "Table"
  pivotStyles$rootStyle <- "ColumnHeader"
  pivotStyles$rowHeaderStyle <- "RowHeader"
  pivotStyles$colHeaderStyle <- "ColumnHeader"
  pivotStyles$cellStyle <- "Cell"
  pivotStyles$totalStyle <- "Total"
  return(invisible(pivotStyles))
}
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$theme <- createCustomTheme(pt)
pt$renderPivot(styleNamePrefix="t8")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory", styleDeclarations=list("color"="red", "font-weight"="bold", "background-color"="yellow"))
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
pt$renderPivot(styleNamePrefix="tdg")

## ---- message=FALSE, warning=FALSE---------------------------------------
library(pivottabler)
pt <- PivotTable$new()
pt$styles$addStyle(styleName="NewHeadingStyle1", list(
      "font-family"="Arial",
      "font-size"="0.75em",
      padding="2px",
      border="1px solid lightgray",
      "vertical-align"="middle",
      "text-align"="center",
      "font-weight"="bold",
      "background-color"="Gold",
      "xl-wrap-text"="wrap"
    ))
pt$styles$addStyle(styleName="CellStyle1", list(
      "font-family"="Arial",
      "font-size"="0.75em",
      padding="2px 2px 2px 8px",
      border="1px solid lightgray",
      "vertical-align"="middle",
      "background-color"="Yellow",
      "text-align"="right"
    ))
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains1", summariseExpression="n()",
                     headingBaseStyleName="NewHeadingStyle1", cellBaseStyleName="CellStyle1")
pt$defineCalculation(calculationName="TotalTrains2", summariseExpression="n()",
                     headingStyleDeclarations=list("color"="red", "font-weight"="bold"),
                     cellStyleDeclarations=list("color"="blue"))
pt$renderPivot(styleNamePrefix="tcn")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the colours
orangeColors <- list(
  headerBackgroundColor = "rgb(237, 125, 49)",
  headerColor = "rgb(255, 255, 255)",
  cellBackgroundColor = "rgb(255, 255, 255)",
  cellColor = "rgb(0, 0, 0)",
  totalBackgroundColor = "rgb(248, 198, 165)",
  totalColor = "rgb(0, 0, 0)",
  borderColor = "rgb(198, 89, 17)"
)
# create the pivot table
library(pivottabler)
pt <- PivotTable$new()
pt$addData(bhmtrains)
pt$addColumnDataGroups("TrainCategory")
pt$addRowDataGroups("TOC")
pt$defineCalculation(calculationName="TotalTrains", summariseExpression="n()")
# define the theme
theme <- getSimpleColoredTheme(parentPivot=pt, colors=orangeColors, fontName="Garamond, arial")
pt$theme <- theme
# evaluate the pivot to generate the cells
pt$evaluatePivot()
# apply an additional highlight to one cell (3rd row, 2nd column)
cellHighlight <- pt$createInlineStyle(declarations=list("background-color"="#FFFF00"))
cells <- pt$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(3, 2)))
cells[[1]]$style <- cellHighlight
# draw the pivot table
pt$renderPivot(styleNamePrefix="t9")

