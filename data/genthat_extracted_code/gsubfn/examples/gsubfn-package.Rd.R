library(gsubfn)


### Name: gsubfn-package
### Title: gsubfn
### Aliases: gsubfn-package
### Keywords: package

### ** Examples


# replace each number with that number plus 1
gsubfn("[[:digit:]]+", function(x) as.numeric(x)+1, "(10 20)(100 30)") 

# same
gsubfn("[[:digit:]]+", ~ as.numeric(x)+1, "(10 20)(100 30)") 

# replace each number with its cumulative sum
pcumsum <- proto(pre = function(this) this$sum <- 0,
   fun = function(this, x) { sum <<- sum + as.numeric(x) }
)
gsubfn("[0-9]+", pcumsum, "10 abc 5 1")

# split out numbers
strapply("12abc34 55", "[0-9]+")

fn$optim(1, ~ x^2, method = "CG")

fn$integrate(~ sin(x) + cos(x), 0, pi/2)

fn$lapply(list(1:4, 1:5), ~ LETTERS[x]) # list(LETTERS[1:4], LETTERS[1:5])

fn$mapply(~ seq_len(x) + y * z, 1:3, 4:6, 2) # list(9, 11:12, 13:15)

# must specify x since . is a free variable
fn$by(CO2[4:5], CO2[1], x ~ coef(lm(uptake ~ ., x)), simplify = rbind)

# evaluate f at x^2 where f may be function or formula
square <- function(f, x, ...) { f <- match.funfn(f); f(x^2, ...) }
square(~ exp(x)/x, pi)
square(function(x) exp(x)/x, pi) # same




