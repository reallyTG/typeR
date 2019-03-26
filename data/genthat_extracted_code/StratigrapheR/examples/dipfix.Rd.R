library(StratigrapheR)


### Name: dipfix
### Title: Fix Dip
### Aliases: dipfix

### ** Examples

strike   <- c(-60, 180,20,0,20)
dip      <- c(-60,20,-45,110,-90)
quadrant <- c("N",NA,NA,NA,"E")
inverted <- c(FALSE,TRUE,FALSE,TRUE,FALSE)

dipfix(strike,dip,quadrant,inverted)

dipfix(strike,dip,quadrant)




