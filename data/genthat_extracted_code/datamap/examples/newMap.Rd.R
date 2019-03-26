library(datamap)


### Name: newMap
### Title: Function for creating datamap objects
### Aliases: newMap
### Keywords: programming environment

### ** Examples

newMapper(
	type="EXAMPLE",
	init=function(map,symbols=c('foo','bar','baz'),len=3){

		# Install symbols that the users passes in from newMap().
		lapply(symbols,install,map)

		# Now let's add some state to the internal portion of our map.
		map$len <- len

		# Returning FALSE means failure
		return(TRUE)
	},
	get = function(x) {
		cat("I'll just get",x,"for you.\n")

		# len is pulled from the internal portion of the map
		# by lexical scoping rules. Anything can be returned here, but we 
		# default to a numeric value
		rnorm(len)
	},
	assign = function(x,val){
		cat("Calling assign",val,"to",x,".\n")
	},
	finalize = function(map){
		cat("Finalization can clear any state, like shutting down database\n")
		cat("connections, socket connections, etc.\n")
	},

	# The rest of the arguments are copied to the internal portion of the map.
	foo = 'bar'
)

m <- newMap('EXAMPLE')

# Summary of the map
m

# [[ works
m[['bar']]

# datamaps are environments
with(m,bar)

# use functions to access either installed objects
# or those that aren't.
m$get('bar')

# adding extra variables to the map.
with(m,x <- 'buzzle')

m

# attach the map the search path
# and update either the map or the search path position.
# changes are persistent
mapAttach(m)
baz
rm(m)
foo
detach('datamap:EXAMPLE')




