library(rquery)


### Name: local_td
### Title: Construct a table description of a local data.frame.
### Aliases: local_td

### ** Examples


d <- data.frame(x = 1)
local_td(d)
local_td("d")
local_td(as.name("d"))
local_td(data.frame(x = 1))
d %.>% local_td # needs wrapr 1.5.0 or newer to capture name




