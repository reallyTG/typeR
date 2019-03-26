library(corrgram)


### Name: baseball
### Title: Baseball Hitter's Data
### Aliases: baseball
### Keywords: datasets

### ** Examples


vars2 <- c("Assists","Atbat","Errors","Hits","Homer","logSal",
           "Putouts","RBI","Runs","Walks","Years")
corrgram(baseball[,vars2],
         lower.panel=panel.shade, upper.panel=panel.pie)




