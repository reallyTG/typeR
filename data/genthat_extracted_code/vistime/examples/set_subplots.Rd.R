library(vistime)


### Name: set_subplots
### Title: Find correct subplot for ranges and events
### Aliases: set_subplots

### ** Examples

## Not run: 
##D set_subplots(data.frame(event = 1:4, start = c(Sys.Date(), Sys.Date() + 10),
##D                    end = c(Sys.Date(), Sys.Date() + 10), group = ""))
##D set_subplots(data.frame(event = 1:4, start = c(Sys.Date(), Sys.Date() + 10),
##D                    end = c(Sys.Date(), Sys.Date() + 10), group = 1:2))
##D set_subplots(data.frame(event = 1:3, start = c(Sys.Date(), Sys.Date() + 20,
##D                    Sys.Date()), end = c(Sys.Date()+10, Sys.Date()+20, Sys.Date()),
##D                    group = c(1,2,1)))
## End(Not run)



