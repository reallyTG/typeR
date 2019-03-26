library(needy)


### Name: require_a
### Title: Ensure a value has a desired set of traits.
### Aliases: add_trait implemented_traits require_a

### ** Examples


safeMap <- function (f, x) {
	# map, with verification by require_a

	pcall <- "safeMap(f, x)"
	require_a('unary function', f, pcall)
	require_a('listy', x)

	Map(f, x)
}

safeSum <- function (a, b) {

	pcall <- sys.call()
	require_a("finite numeric", a, pcall)
	require_a("finite numeric", b, pcall)

	a + b
}

definitelyNotNull <- function (x) {

	pcall <- sys.call()
	require_a("!null", x, pcall)

	x
}

safeMatchFun <- function (f) {
	# match.fun with arg checking

	pcall <- sys.call()
	require_a(c("string", "function", "symbol"), f, pcall)
	require_a("functionable") #my prefered shorthand for the above

	match.fun(f)
}



