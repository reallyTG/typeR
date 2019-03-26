library(EngrExpt)


### Name: curl
### Title: Curl of transparencies
### Aliases: curl
### Keywords: datasets

### ** Examples

str(curl)
xtabs(~ catalyst + compa, curl)   ## display the experimental design
xyplot(curl ~ compa | ordered(catalyst), curl,
       type = c("g","p","r"), layout = c(3,1),
       xlab = "Amount of component `a' - panels are amount of catalyst",
       ylab = "Amount of curl")



