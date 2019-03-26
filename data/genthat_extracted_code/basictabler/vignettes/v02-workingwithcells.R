## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
library(basictabler)
tbl <- BasicTable$new()
tbl$cells$setCell(1, 1, cellType="root", rawValue="Sale ID")
tbl$cells$setCell(1, 2, cellType="columnHeader", rawValue="Item")
tbl$cells$setCell(1, 3, cellType="columnHeader", rawValue="Quantity")
tbl$cells$setCell(1, 4, cellType="columnHeader", rawValue="Price")
tbl$cells$setCell(2, 1, cellType="rowHeader", rawValue=5334)
tbl$cells$setCell(2, 2, cellType="cell", rawValue="Apple")
tbl$cells$setCell(2, 3, cellType="cell", rawValue=5)
tbl$cells$setCell(2, 4, cellType="cell", rawValue=0.34)
tbl$cells$setCell(3, 1, cellType="rowHeader", rawValue=5336)
tbl$cells$setCell(3, 2, cellType="cell", rawValue="Orange")
tbl$cells$setCell(3, 3, cellType="cell", rawValue=8)
tbl$cells$setCell(3, 4, cellType="cell", rawValue=0.47)
tbl$cells$setCell(4, 1, cellType="rowHeader", rawValue=5338)
tbl$cells$setCell(4, 2, cellType="cell", rawValue="Banana")
tbl$cells$setCell(4, 3, cellType="cell", rawValue=6)
tbl$cells$setCell(4, 4, cellType="cell", rawValue=1.34)
tbl$renderTable()

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$cells$setCell(1, 1, cellType="root", rawValue="Sale ID")
tbl$cells$setCell(1, 2, cellType="columnHeader", rawValue="Item")
tbl$cells$setCell(1, 3, cellType="columnHeader", rawValue="Quantity")
tbl$cells$setCell(1, 4, cellType="columnHeader", rawValue="Price")
tbl$cells$setColumn(1, cellTypes="rowHeader", rawValues=saleIds)
tbl$cells$setColumn(2, cellTypes="cell", rawValues=items)
tbl$cells$setColumn(3, cellTypes="cell", rawValues=quantities)
tbl$cells$setColumn(4, cellTypes="cell", rawValues=prices,
                    formats=list("%.2f"))
tbl$renderTable()

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
# cell types for the cells in each row
cellTypes <- c("rowHeader", "cell", "cell", "cell")

# formats for the values in each row
# (only the value in the fourth column needs formatting)
formats <- list(NULL, NULL, NULL, "%.2f")

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$cells$setCell(1, 1, cellType="root", rawValue="Sale ID")
tbl$cells$setCell(1, 2, cellType="columnHeader", rawValue="Item")
tbl$cells$setCell(1, 3, cellType="columnHeader", rawValue="Quantity")
tbl$cells$setCell(1, 4, cellType="columnHeader", rawValue="Price")
tbl$cells$setRow(2, cellTypes=cellTypes, formats=formats,
                 rawValues=list(5334, "Apple", 5, 0.34452354))
tbl$cells$setRow(3, cellTypes=cellTypes, formats=formats,
                 rawValues=list(5336, "Orange", 8, 0.4732543))
tbl$cells$setRow(4, cellTypes=cellTypes, formats=formats,
                 rawValues=list(5338, "Banana", 6, 1.3443243))
tbl$renderTable()

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
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
tbl$renderTable()

# get the raw value of the cell in row 2 column 4
cat(tbl$cells$getValue(2, 4))

# get the formatted value of the cell in row 2 column 4
cat(tbl$cells$getValue(2, 4, formattedValue=TRUE))

# get the values in row 2 (as a list due to different data types)
rowValues <- tbl$cells$getRowValues(2, asList=TRUE)

# convert to character values for outputting
rowValues <- lapply(rowValues, as.character)
cat(class(rowValues), ": ", paste(rowValues, collapse=", "))

# get the values in column 3
columnValues <- tbl$cells$getColumnValues(3)
cat(class(columnValues), ": ", paste(columnValues, collapse=", "))

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
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
tbl$renderTable()

# get the cell in row 2 column 4
cell <- tbl$cells$getCell(2, 4)

# output the cell properties
summary <- list(rowNumber=cell$rowNumber, columnNumber=cell$columnNumber, cellType=cell$cellType,
                visible=cell$visible, rawValue=cell$rawValue, formattedValue=cell$formattedValue,
                baseStyleName=ifelse(is.null(cell$baseStyleName), "", cell$baseStyleName), 
                style=ifelse(is.null(cell$style), "", cell$style$asCSSRule()))
description <- paste(paste(names(summary), unlist(summary), sep="="), collapse="\n")
cat(description)

## ---- message=FALSE, eval=TRUE, warning=FALSE, comment=""----------------
# data for the table
saleIds <- c(5334, 5336, 5338)
items <- c("Apple", "Orange", "Banana")
quantities <- c(5, 8, 6)
prices <- c(0.34452354, 0.4732543, 1.3443243)

# row formats
formats <- list(NULL, NULL, NULL, NULL, "%.2f")

# construct the table
library(basictabler)
tbl <- BasicTable$new()
tbl$addData(data.frame(saleIds, items, quantities, prices), 
            firstColumnAsRowHeaders=TRUE,
            explicitColumnHeaders=c("Sale ID", "Item", "Quantity", "Price"),
            columnFormats=list(NULL, NULL, NULL, "%.2f"))
tbl$renderTable()

tbl$cells$insertColumn(3)
tbl$cells$setCell(1, 3, cellType="columnHeader", rawValue="Variety")
tbl$cells$setColumn(3, rawValues=c("Gala", "Jaffa", "Yellow"))
tbl$renderTable()

tbl$cells$insertRow(3)
tbl$cells$setRow(3, cellTypes=c("rowHeader", "cell", "cell", "cell", "cell"),
                 rawValues=list(5335, "Pear", "Marit", 2, 0.89),
                 formats=formats)
tbl$renderTable()

tbl$cells$insertRow(5)
tbl$cells$setRow(5, cellTypes=c("rowHeader", "cell", "cell", "cell", "cell"),
                 rawValues=list(5337, "Plum", "Sweet", 5, 1.59),
                 formats=formats)
tbl$renderTable()

tbl$cells$setCell(1, 6, cellType="columnHeader", rawValue="Total")
qty <- tbl$cells$getColumnValues(4)
price <- tbl$cells$getColumnValues(5)
total <- qty * price
tbl$cells$setColumn(6, cellType="cell", rawValues=total, formats="%.2f")
tbl$renderTable()

tbl$cells$deleteRow(3)
tbl$renderTable()

tbl$cells$deleteColumn(3)
tbl$renderTable()

tbl$cells$deleteCell(3, 2)
tbl$renderTable()

