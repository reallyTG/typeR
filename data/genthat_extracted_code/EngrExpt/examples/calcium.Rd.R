library(EngrExpt)


### Name: calcium
### Title: Calcium levels before and after taking vitamin
### Aliases: calcium
### Keywords: datasets

### ** Examples

str(calcium)
show(pl1 <-
     xyplot(hrs3 ~ hrs0, calcium, type = c("g","p"), aspect = "iso",
            xlab = "Calcium level (mg/dl) before taking multi-vitamin",
            ylab =
            "Calcium level (mg/dl) 3 hours after taking multi-vitamin"))
tmd(pl1)



