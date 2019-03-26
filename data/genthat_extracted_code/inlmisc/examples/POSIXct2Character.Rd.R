library(inlmisc)


### Name: POSIXct2Character
### Title: Convert from POSIXct to Character
### Aliases: POSIXct2Character
### Keywords: manip

### ** Examples

txt <- c("11/10/2011 07:49:36.3", "04/01/2013 17:22:08.123",
         "01/06/2013 01:02:16.123", "12/14/2038 15:42:04.123456")
date.time <- as.POSIXct(txt, format = "%m/%d/%Y %H:%M:%OS")

options("digits.secs" = 3)
format(date.time, fmt = "%d/%m/%Y %H:%M:%OS")
format(date.time, fmt = "%d/%m/%Y %H:%M:%OS3")

POSIXct2Character(date.time, fmt = "%d/%m/%Y %H:%M:%OS3")
POSIXct2Character(date.time, fmt = "%d/%m/%Y %H:%M:%OS4")
POSIXct2Character(date.time, fmt = "%d/%m/%Y %H:%M:%OS2")

POSIXct2Character(date.time, fmt = "%H:%M:%OS3 %Y-%m-%d")




