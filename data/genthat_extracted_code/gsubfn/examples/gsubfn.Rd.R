library(gsubfn)


### Name: gsubfn
### Title: Pattern Matching and Replacement
### Aliases: gsubfn cat0
### Keywords: character

### ** Examples


# adds 1 to each number in third arg
gsubfn("[[:digit:]]+", function(x) as.numeric(x)+1, "(10 20)(100 30)") 

# same but using formula notation for function
gsubfn("[[:digit:]]+", ~ as.numeric(x)+1, "(10 20)(100 30)") 

# replaces pairs m:n with their sum
s <- "abc 10:20 def 30:40 50"
gsubfn("([0-9]+):([0-9]+)", ~ as.numeric(x) + as.numeric(y), s)

# default pattern for gsubfn does quasi-perl-style string interpolation
gsubfn( , , "pi = $pi, 2pi = `2*pi`") 

# Extracts numbers from string and places them into numeric vector v.
# Normally this would be done in strapply instead.
v <- c(); f <- function(x) v <<- append(v,as.numeric(x))
junk <- gsubfn("[0-9]+", f, "12;34:56,89,,12")
v

# same
strapply("12;34:56,89,,12", "[0-9]+", simplify = c)

# replaces numbers with that many Xs separated by -
gsubfn("[[:digit:]]+", ~ paste(rep("X", n), collapse = "-"), "5.2")

# replaces units with scale factor
gsubfn(".m", list(cm = "e1", km = "e6"), "33cm 45km")

# place <...> around first two occurrences
p <- proto(fun = function(this, x) if (count <= 2) paste0("<", x, ">") else x)
gsubfn("\\w+", p, "the cat in the hat is back")

# replace each number by cumulative sum to that point
p2 <- proto(pre = function(this) this$value <- 0,
	fun = function(this, x) this$value <- value + as.numeric(x))
gsubfn("[0-9]+", p2, "12 3 11, 25 9")

# this only works if your R installation has tcltk capabilities
# See following example for corresponding code with R engine
if (isTRUE(capabilities()[["tcltk"]])) {
	gsubfn("(.)\\1", ~ paste0(`&`, "!"), "abbcddd")
}

# with R and backref >=0 (implied) the pattern is internally parenthesized
# so must use \2 rather than \1
gsubfn("(.)\\2", ~ paste0(`&`, "!"), "abbcddd", engine = "R")





