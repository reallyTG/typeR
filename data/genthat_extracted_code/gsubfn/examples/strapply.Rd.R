library(gsubfn)


### Name: strapply
### Title: Apply a function over a string or strings.
### Aliases: strapply strapply1 ostrapply strapplyc tclList2R
### Keywords: character

### ** Examples


strapply("12;34:56,89,,12", "[0-9]+")

# separate leading digits from rest of string
# creating a 2 column matrix: digits, rest
s <- c("123abc", "12cd34", "1e23")
t(strapply(s, "^([[:digit:]]+)(.*)", c, simplify = TRUE)) 

# same but create matrix
strapply(s, "^([[:digit:]]+)(.*)", c, simplify = rbind)

# running window of 5 characters using 0-lookahead perl regexp
# Note that the three ( in the regexp will fool it into thinking there
# are three backreferences so specify backref explicitly.
x <- "abcdefghijkl"
strapply(x, "(.)(?=(....))",  paste0, backref = -2, perl = TRUE)[[1]]

# Note difference.  First gives character vector.  Second is the same.
# Third has same elements but is a list.
# Fourth gives list of two character vectors. Fifth is the same.
strapply("a:b c:d", "(.):(.)", c)[[1]]
strapply("a:b c:d", "(.):(.)", list, simplify = unlist) # same

strapply("a:b c:d", "(.):(.)", list)[[1]]

strapply("a:b c:d", "(.):(.)", c, combine = list)[[1]]
strapply("a:b c:d", "(.):(.)", c, combine = list, simplify = c) # same

# find second CPU_SPEED value given lines of config file
Lines <- c("DEVICE = 'PC'", "CPU_SPEED = '1999', '233'")
parms <- strapply(Lines, "[^ ',=]+", c, USE.NAMES = TRUE, 
	simplify = ~ lapply(list(...), "[", -1))
parms$CPU_SPEED[2]

# return first two words in each string
p <- proto(fun = function(this, x) if (count <=2) x)
strapply(c("the brown fox", "the eager beaver"), "\\w+", p)

## Not run: 
##D # convert to chron
##D library(chron)
##D x <- c("01/15/2005 23:32:45", "02/27/2005 01:22:30")
##D x.chron <- strapply(x, "(../../....) (..:..:..)",  chron, simplify = c)
##D 
##D # time parsing of all 275,546 words from James Joyce's Ulysses
##D joyce <- readLines("http://www.gutenberg.org/files/4300/4300-8.txt") 
##D joycec <- paste(joyce, collapse = " ") 
##D system.time(s <- strapplyc(joycec, "\\w+")[[1]]) 
##D length(s) # 275546 
## End(Not run)




