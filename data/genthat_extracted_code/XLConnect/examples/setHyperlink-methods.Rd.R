library(XLConnect)


### Name: setHyperlink-methods
### Title: Setting hyperlinks
### Aliases: setHyperlink setHyperlink-methods
###   setHyperlink,workbook,missing,character-method
###   setHyperlink,workbook,missing,numeric-method
###   setHyperlink,workbook,character,missing-method
### Keywords: methods utilities

### ** Examples

# Load workbook (create if not existing)
wb <- loadWorkbook("setHyperlink.xlsx", create = TRUE)

# Create a sheet named 'mtcars'
createSheet(wb, name = "mtcars")


# Write built-in data set 'mtcars' to the above defined worksheet
writeWorksheet(wb, mtcars, sheet = "mtcars", rownames = "Car")

# Set hyperlinks
links <- paste0("http://www.google.com?q=", gsub(" ", "+", rownames(mtcars)))
setHyperlink(wb, sheet = "mtcars", row = seq_len(nrow(mtcars)) + 1, col = 1,
  type = XLC$HYPERLINK.URL, address = links)

# Save workbook (this actually writes the file to disk)
saveWorkbook(wb)



