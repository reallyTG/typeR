library(RTest)


### Name: show,RTestCollection-method
### Title: Show Summary of RTestCollection Instance
### Aliases: show,RTestCollection-method

### ** Examples

location <- find.package("RTest")

testCollection <- new("RTestCollection",
	project.name    = "RTest Vignette", 
	project.details = "Example test exectuion",
	tester          = "Example tester",
	test.start      = format(Sys.time(), "%Y-%m-%d %H:%M:%S"))

show(testCollection)

testCollection <- importTCsFromDir(testCollection,
	xml.dPath = paste0(location,"/xml-templates")
)

# Now one test case shall be imported
show(testCollection)




