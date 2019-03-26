library(gestalt)


### Name: compose
### Title: Compose Functions
### Aliases: compose %>>>%

### ** Examples

# Functions are applied in the order in which they are listed
inv <- partial(`/`, 1)  # reciprocal
f0 <- compose(abs, log, inv)
stopifnot(all.equal(f0(-2), 1 / log(abs(-2))))

# Alternatively, compose using the `%>>>%` operator
f1 <- abs %>>>% log %>>>% {1 / .}
stopifnot(all.equal(f1(-2), f0(-2)))

## Not run: 
##D # Transform a function to a JSON function
##D library(jsonlite)
##D 
##D # By composing higher-order functions:
##D jsonify <- {fromJSON %>>>% .} %>>>% {. %>>>% toJSON}
##D 
##D # By directly composing with input/output transformers:
##D jsonify <- fn(f ~ fromJSON %>>>% f %>>>% toJSON)
## End(Not run)

# Formals of initial function are preserved
add <- function(a, b = 0) a + b
stopifnot(identical(formals(compose(add, inv)), formals(add)))

# Compositions can be provided by lists, in several equivalent ways
f2 <- compose(list(abs, log, inv))
f3 <- compose(!!! list(abs, log, inv))
f4 <- compose(abs, list(log, inv))
f5 <- compose(abs, !!! list(log, inv))
stopifnot(
  all.equal(f2, f0), all.equal(f2(-2), f0(-2)),
  all.equal(f3, f0), all.equal(f3(-2), f0(-2)),
  all.equal(f4, f0), all.equal(f4(-2), f0(-2)),
  all.equal(f5, f0), all.equal(f5(-2), f0(-2))
)

# compose() and as.list() are mutally invertible
f6 <- compose(abs, as.list(compose(log, inv)))
stopifnot(
  all.equal(f6, f0), all.equal(f6(-2), f0(-2))
)
fs <- list(abs, log, inv)
stopifnot(all.equal(check.attributes = FALSE,
  as.list(compose(fs)), fs,
))

# `%>>>%` supports names, magrittr `%>%` semantics, and quasiquotation
sep <- ""
scramble <- shuffle: sample %>>>% paste(collapse = !!sep)
nonsense <- scramble(letters)
stopifnot(
  nchar(nonsense) == 26L,
  identical(letters, sort(strsplit(nonsense, sep)[[1]])),
  identical(scramble$shuffle, sample)
)




