library(rlang)


### Name: tidy-dots
### Title: Collect dots tidily
### Aliases: tidy-dots dots_list list2

### ** Examples

# Let's create a function that takes a variable number of arguments:
numeric <- function(...) {
  dots <- list2(...)
  num <- as.numeric(dots)
  set_names(num, names(dots))
}
numeric(1, 2, 3)

# The main difference with list(...) is that list2(...) enables
# the `!!!` syntax to splice lists:
x <- list(2, 3)
numeric(1, !!! x, 4)

# As well as unquoting of names:
nm <- "yup!"
numeric(!!nm := 1)


# One useful application of splicing is to work around exact and
# partial matching of arguments. Let's create a function taking
# named arguments and dots:
fn <- function(data, ...) {
  list2(...)
}

# You normally cannot pass an argument named `data` through the dots
# as it will match `fn`'s `data` argument. The splicing syntax
# provides a workaround:
fn("wrong!", data = letters)  # exact matching of `data`
fn("wrong!", dat = letters)   # partial matching of `data`
fn(some_data, !!!list(data = letters))  # no matching


# Empty arguments trigger an error by default:
try(fn(, ))

# You can choose to preserve empty arguments instead:
list3 <- function(...) dots_list(..., .preserve_empty = TRUE)

# Note how the last empty argument is still ignored because
# `.ignore_empty` defaults to "trailing":
list3(, )

# The list with preserved empty arguments is equivalent to:
list(missing_arg())


# Arguments with duplicated names are kept by default:
list2(a = 1, a = 2, b = 3, b = 4, 5, 6)

# Use the `.homonyms` argument to keep only the first of these:
dots_list(a = 1, a = 2, b = 3, b = 4, 5, 6, .homonyms = "first")

# Or the last:
dots_list(a = 1, a = 2, b = 3, b = 4, 5, 6, .homonyms = "last")

# Or raise an informative error:
try(dots_list(a = 1, a = 2, b = 3, b = 4, 5, 6, .homonyms = "error"))


# dots_list() can be configured to warn when a `<-` call is
# detected:
my_list <- function(...) dots_list(..., .check_assign = TRUE)
my_list(a <- 1)

# There is no warning if the assignment is wrapped in braces.
# This requires users to be explicit about their intent:
my_list({ a <- 1 })



