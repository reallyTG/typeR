library(TFX)


### Name: ParseTrueFX
### Title: Parse TrueFX(tm) response
### Aliases: ParseTrueFX

### ** Examples

# x <- QueryTrueFX()  #Cannot run this if no internet connection
x <- paste0("EUR/USDUSD/JPY1.31#81.9085661.31#81.9435941.31990#81.6421.3182",
            "1#81.50413351311514701335131150004")
ParseTrueFX(x)
ParseTrueFX(x, pretty=FALSE)



