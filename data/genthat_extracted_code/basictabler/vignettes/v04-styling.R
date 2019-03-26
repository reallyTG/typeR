## ---- message=FALSE, warning=FALSE, eval=FALSE---------------------------
#  tableStyles$addStyle(styleName="ColumnHeader", list(
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
# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
tbl$theme <- "default"  # this theme is already the default, so this line isn't really needed
tbl$renderTable(styleNamePrefix="t0")

## ---- message=FALSE, warning=FALSE---------------------------------------
# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
tbl$theme <- "compact"
tbl$renderTable(styleNamePrefix="t1")

## ---- message=FALSE, warning=FALSE---------------------------------------
# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
tbl$theme <- "largeplain"
tbl$renderTable(styleNamePrefix="t2")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=blue1Colors, fontName="Verdana, Arial")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t3")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=grayColors, fontName="Courier New, Courier")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t4")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=orangeColors, fontName="Garamond, arial")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t5")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=greenColors, fontName="Helvetica, arial")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t6")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=yellowColors, fontName="Verdana")
tbl$theme <- theme
tbl$renderTable(styleNamePrefix="t7")

## ---- message=FALSE, warning=FALSE---------------------------------------
# define the theme and styles
createCustomTheme <- function(parentTable=NULL, themeName="myCustomTheme") {
  tableStyles <- TableStyles$new(parentTable=parentTable, themeName=themeName)
  # borders in purple
  tableStyles$addStyle(styleName="Table", list(
      "border-collapse"="collapse",
      "border"="2px solid #B28DFF"
    ))
  # column headings in pink
  tableStyles$addStyle(styleName="ColumnHeader", list(
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
  tableStyles$addStyle(styleName="RowHeader", list(
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
  tableStyles$addStyle(styleName="Cell", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      padding="2px 2px 2px 8px",
      "border"="1px solid #B28DFF",
      "text-align"="right",
      color="#FF800D",
      "background-color"="#FFFFD1"
    ))
  # totals in orange
  tableStyles$addStyle(styleName="Total", list(
      "font-family"="\"Courier New\", Courier, monospace",
      "font-size"="0.75em",
      "font-weight"="bold",
      padding="2px 2px 2px 8px",
      "border"="1px solid rgb(84, 130, 53)",
      "text-align"="right",
      color="#3BC6B6",
      "background-color"="#BFFCC6"
    ))
  tableStyles$tableStyle <- "Table"
  tableStyles$rootStyle <- "ColumnHeader"
  tableStyles$rowHeaderStyle <- "RowHeader"
  tableStyles$colHeaderStyle <- "ColumnHeader"
  tableStyles$cellStyle <- "Cell"
  tableStyles$totalStyle <- "Total"
  return(invisible(tableStyles))
}

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
tbl$theme <- createCustomTheme(tbl)
tbl$renderTable(styleNamePrefix="t8")

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

# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))

# theme the table and render
theme <- getSimpleColoredTblTheme(parentTable=tbl, colors=orangeColors, fontName="Garamond, arial")
tbl$theme <- theme

# apply an additional highlight to one cell (3rd row, 2nd column)
cellHighlight <- tbl$createInlineStyle(declarations=list("background-color"="#FFFF00"))
cells <- tbl$getCells(specifyCellsAsList=TRUE, cellCoordinates=list(c(3, 2)))
cells[[1]]$style <- cellHighlight
# render the table
tbl$renderTable(styleNamePrefix="t9")

