library(schoRsch)


### Name: toclipboard
### Title: Copy Data to Clipboard
### Aliases: toclipboard
### Keywords: utilities

### ** Examples

## Build data frame
var1 <- c(1:9)
var2 <- c(1,1,1,2,2,2,3,3,3)
tmpdata <- data.frame(cbind(var1,var2))

## Write data frame to clipboard
toclipboard(tmpdata)

## -> The data frame can now be pasted
## into any other application.



