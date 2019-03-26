library(latticeExtra)


### Name: combineLimits
### Title: Combine axis limits across margins
### Aliases: combineLimits
### Keywords: dplot

### ** Examples


data(Cars93, package = "MASS")

## FIXME: log scales don't yet work

pcars <- 
    xyplot(Price ~ EngineSize | reorder(AirBags, Price) + Cylinders,
           data = Cars93, 
           subset = Cylinders != "rotary" & Cylinders != "5", 
           scales = list(relation = "free",
                         y = list(log = FALSE, tick.number = 3, rot = 0)),
           xlab = "Engine Size (litres)", 
           ylab = "Average Price (1000 USD)",
           as.table = TRUE) 

combineLimits(pcars)

useOuterStrips(combineLimits(update(pcars, grid = TRUE),
                             margin.x = c(1, 2), adjust.labels = FALSE))

useOuterStrips(combineLimits(update(pcars, grid = TRUE)))




