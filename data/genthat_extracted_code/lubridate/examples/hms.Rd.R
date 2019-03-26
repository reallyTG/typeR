library(lubridate)


### Name: ms
### Title: Parse periods with *h*our, *m*inute, and *s*econd components
### Aliases: ms hm hms
### Keywords: period

### ** Examples

ms(c("09:10", "09:02", "1:10"))
ms("7 6")
ms("6,5")
hm(c("09:10", "09:02", "1:10"))
hm("7 6")
hm("6,5")

x <- c("09:10:01", "09:10:02", "09:10:03")
hms(x)

hms("7 6 5", "3:23:::2", "2 : 23 : 33", "Finished in 9 hours, 20 min and 4 seconds")



