library(openxlsx)


### Name: makeHyperlinkString
### Title: create Excel hyperlink string
### Aliases: makeHyperlinkString

### ** Examples


## Writing internal hyperlinks
wb <- createWorkbook()
addWorksheet(wb, "Sheet1")
addWorksheet(wb, "Sheet2")
addWorksheet(wb, "Sheet 3")
writeData(wb, sheet = 3, x = iris)

## External Hyperlink
x <- c("https://www.google.com", "https://www.google.com.au")
names(x) <- c("google", "google Aus")
class(x) <- "hyperlink"

writeData(wb, sheet = 1, x = x, startCol = 10)


## Internal Hyperlink - create hyperlink formula manually
writeFormula(wb, "Sheet1", x = '=HYPERLINK("#Sheet2!B3", "Text to Display - Link to Sheet2")'
  , startCol = 3)

## Internal - No text to display using makeHyperlinkString() function
writeFormula(wb, "Sheet1", startRow = 1
, x = makeHyperlinkString(sheet = "Sheet 3", row = 1, col = 2))

## Internal - Text to display
writeFormula(wb, "Sheet1", startRow = 2, 
  x = makeHyperlinkString(sheet = "Sheet 3", row = 1, col = 2
    , text = "Link to Sheet 3"))

## Link to file - No text to display
writeFormula(wb, "Sheet1", startRow = 4
 , x = makeHyperlinkString(sheet = "testing", row = 3, col = 10
   , file = system.file("loadExample.xlsx", package = "openxlsx")))

## Link to file - Text to display
writeFormula(wb, "Sheet1", startRow = 3
  , x = makeHyperlinkString(sheet = "testing", row = 3, col = 10
    , file = system.file("loadExample.xlsx", package = "openxlsx"), text = "Link to File."))

saveWorkbook(wb, "internalHyperlinks.xlsx")



