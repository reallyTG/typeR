library(clickR)


### Name: mine.plot
### Title: Mine plot
### Aliases: mine.plot

### ** Examples

mine.plot(airquality)   #Displays missing data
mine.plot(airquality, what="x>mean(x)+2*sd(x) | x<mean(x)-2*sd(x)")   #Shows extreme values



