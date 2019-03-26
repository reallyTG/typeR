library(rlang)


### Name: trace_back
### Title: Capture a backtrace
### Aliases: trace_back

### ** Examples

# Trim backtraces automatically (this improves the generated
# documentation for the rlang website and the same trick can be
# useful within knitr documents):
options(rlang_trace_top_env = current_env())

f <- function() g()
g <- function() h()
h <- function() trace_back()

# When no lazy evaluation is involved the backtrace is linear
# (i.e. every call has only one child)
f()

# Lazy evaluation introduces a tree like structure
identity(identity(f()))
identity(try(f()))
try(identity(f()))

# When printing, you can request to simplify this tree to only show
# the direct sequence of calls that lead to `trace_back()`
x <- try(identity(f()))
x
print(x, simplify = "branch")

# With a little cunning you can also use it to capture the
# tree from within a base NSE function
x <- NULL
with(mtcars, {x <<- f(); 10})
x


# Restore default top env for next example
options(rlang_trace_top_env = NULL)

# When code is executed indirectly, i.e. via source or within an
# RMarkdown document, you'll tend to get a lot of guff at the beginning
# related to the execution environment:
conn <- textConnection("summary(f())")
source(conn, echo = TRUE, local = TRUE)
close(conn)

# To automatically strip this off, specify which frame should be
# the top of the backtrace. This will automatically trim off calls
# prior to that frame:
top <- current_env()
h <- function() trace_back(top)

conn <- textConnection("summary(f())")
source(conn, echo = TRUE, local = TRUE)
close(conn)



