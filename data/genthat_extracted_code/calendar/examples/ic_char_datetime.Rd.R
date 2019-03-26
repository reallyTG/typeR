library(calendar)


### Name: ic_char_datetime
### Title: Convert datetime object to character string
### Aliases: ic_char_datetime ic_char_date

### ** Examples

x <- ic_datetime("20180809T160000")
ic_char_datetime(x) == "20180809T160000"
x <- ic_datetime("20180809T160000Z")
ic_char_datetime(x, zulu = TRUE) == "20180809T160000Z"
ic_char_date(as.Date("1985-12-26"))



