library(EngrExpt)


### Name: vitamin
### Title: Calcium levels before and after vitamin supplement
### Aliases: vitamin
### Keywords: datasets

### ** Examples

str(vitamin)
summary(vitamin)
show(plt1 <- xyplot(after ~ before, vitamin, groups = treatment,
       auto.key = list(space = "right", title = "Formulation", lines = TRUE),
       aspect = "iso",
       type = c("g","p","smooth"),
       xlab  = "Calcium level before the vitamin",
       ylab = "Calcium level after the vitamin"))
tmd(plt1, aspect = 1)
densityplot(~ I(after - before), vitamin, groups = treatment,
            auto.key = list(columns = 3, lines = TRUE),
            xlab = "Change in calcium level after taking vitamin")



