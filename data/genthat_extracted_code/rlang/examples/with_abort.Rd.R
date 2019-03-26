library(rlang)


### Name: with_abort
### Title: Promote all errors to rlang errors
### Aliases: with_abort

### ** Examples

# For cleaner backtraces:
options(rlang_trace_top_env = current_env())

# with_abort() automatically casts simple errors thrown by stop()
# to rlang errors:
fn <- function() stop("Base error")
try(with_abort(fn()))
last_error()

# with_abort() is handy for rethrowing low level errors. The
# backtraces are then segmented between the low level and high
# level contexts.
low_level1 <- function() low_level2()
low_level2 <- function() stop("Low level error")

high_level <- function() {
  with_handlers(
    with_abort(low_level1()),
    error = ~ abort("High level error", parent = .x)
  )
}

try(high_level())
last_error()
summary(last_error())

# Reset to default
options(rlang_trace_top_env = NULL)



