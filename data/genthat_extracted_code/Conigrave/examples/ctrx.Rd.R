library(Conigrave)


### Name: ctrx
### Title: Correlatrix
### Aliases: ctrx correlatrix

### ** Examples

correlatrix(mtcars[,1:5])
library(magrittr)
mtcars %>%
ctrx(x = c("mpg","cyl","disp")
,y = c("wt","drat"),
round = 2,
stars = c(0.05),
describe = list("mean" = function(x) mean(x,na.rm=TRUE)))



