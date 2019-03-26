library(cyclestreets)


### Name: journey
### Title: Plan a journey with CycleStreets.net
### Aliases: journey

### ** Examples

## Not run: 
##D from = c(-1.55, 53.80) # geo_code("leeds")
##D to = c(-1.76, 53.80) # geo_code("bradford uk")
##D r1 = journey(from, to)
##D sf:::plot.sf(r1)
##D to = c(-2, 53.5) # towards manchester
##D r1 = journey(from, to)
##D r2 = journey(from, to, plan = "balanced")
##D plot(r1["busynance"], reset = FALSE)
##D plot(r2["busynance"], add = TRUE)
##D r3 = journey(from, to, silent = FALSE)
##D r4 = journey(from, to, save_raw = TRUE)
##D r5 = journey(from, to, cols = NULL)
## End(Not run)



