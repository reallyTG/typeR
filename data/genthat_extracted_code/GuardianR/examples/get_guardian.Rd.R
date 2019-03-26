library(GuardianR)


### Name: get_guardian
### Title: Search Guardian API for news articles that match the criteria
### Aliases: get_guardian
### Keywords: IO utilities

### ** Examples

## Not run:
results <- get_guardian("islamic+state", 
	section="world",
	from.date="2014-09-16", 
	to.date="2014-09-16", 
	api.key="212d23d3-c7b2-4273-8f1b-289a0803ca4b")
## End(Not run)



