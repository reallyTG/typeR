library(valaddin)


### Name: firmly
### Title: Apply a function firmly
### Aliases: firmly %checkin% loosely is_firm

### ** Examples

## Not run: 
##D 
##D dlog <- function(x, h) (log(x + h) - log(x)) / h
##D 
##D # Require all arguments to be numeric (auto-generated error message)
##D dlog_fm <- firmly(dlog, ~is.numeric)
##D dlog_fm(1, .1)    # [1] 0.9531018
##D dlog_fm("1", .1)  # Error: "FALSE: is.numeric(x)"
##D 
##D # Require all arguments to be numeric (custom error message)
##D dlog_fm <- firmly(dlog, "Not numeric" ~ is.numeric)
##D dlog_fm("1", .1)  # Error: "Not numeric: `x`"
##D 
##D # Alternatively, "globalize" a localized checker (see ?localize, ?globalize)
##D dlog_fm <- firmly(dlog, globalize(vld_numeric))
##D dlog_fm("1", .1)  # Error: "Not double/integer: `x`"
##D 
##D # Predicate functions can be specified anonymously or by name
##D dlog_fm <- firmly(dlog, list(~x, ~x + h, ~abs(h)) ~ function(x) x > 0)
##D dlog_fm <- firmly(dlog, list(~x, ~x + h, ~abs(h)) ~ {. > 0})
##D is_positive <- function(x) x > 0
##D dlog_fm <- firmly(dlog, list(~x, ~x + h, ~abs(h)) ~ is_positive)
##D dlog_fm(1, 0)  # Error: "FALSE: is_positive(abs(h))"
##D 
##D # Describe checks individually using custom error messages
##D dlog_fm <-
##D   firmly(dlog,
##D          list("x not positive" ~ x, ~x + h, "Division by 0 (=h)" ~ abs(h)) ~
##D            is_positive)
##D dlog_fm(-1, 0)
##D # Errors: "x not positive", "FALSE: is_positive(x + h)", "Division by 0 (=h)"
##D 
##D # Specify checks more succinctly by using a (localized) custom checker
##D req_positive <- localize("Not positive" ~ is_positive)
##D dlog_fm <- firmly(dlog, req_positive(~x, ~x + h, ~abs(h)))
##D dlog_fm(1, 0)  # Error: "Not positive: abs(h)"
##D 
##D # Combine multiple checks
##D dlog_fm <- firmly(dlog,
##D                   "Not numeric" ~ is.numeric,
##D                   list(~x, ~x + h, "Division by 0" ~ abs(h)) ~ {. > 0})
##D dlog_fm("1", 0)  # Errors: "Not numeric: `x`", check-eval error, "Division by 0"
##D 
##D # Any check can be expressed using isTRUE
##D err_msg <- "x, h differ in length"
##D dlog_fm <- firmly(dlog, list(err_msg ~ length(x) - length(h)) ~ {. == 0L})
##D dlog_fm(1:2, 0:2)  # Error: "x, h differ in length"
##D dlog_fm <- firmly(dlog, list(err_msg ~ length(x) == length(h)) ~ isTRUE)
##D dlog_fm(1:2, 0:2)  # Error: "x, h differ in length"
##D 
##D # More succinctly, use vld_true
##D dlog_fm <- firmly(dlog, vld_true(~length(x) == length(h), ~all(abs(h) > 0)))
##D dlog_fm(1:2, 0:2)
##D # Errors: "Not TRUE: length(x) == length(h)", "Not TRUE: all(abs(h) > 0)"
##D 
##D dlog_fm(1:2, 1:2)  # [1] 0.6931472 0.3465736
##D 
##D # loosely recovers the underlying function
##D identical(loosely(dlog_fm), dlog)  # [1] TRUE
##D 
##D # Use .warn_missing when you want to ensure an argument is explicitly given
##D # (see vignette("valaddin") for an elaboration of this particular example)
##D as_POSIXct <- firmly(as.POSIXct, .warn_missing = "tz")
##D Sys.setenv(TZ = "EST")
##D as_POSIXct("2017-01-01 03:14:16")  # [1] "2017-01-01 03:14:16 EST"
##D                                    # Warning: "Argument(s) expected ... `tz`"
##D as_POSIXct("2017-01-01 03:14:16", tz = "UTC")  # [1] "2017-01-01 03:14:16 UTC"
##D loosely(as_POSIXct)("2017-01-01 03:14:16")     # [1] "2017-01-01 03:14:16 EST"
##D 
##D # Use firmly to constrain undesirable behavior, e.g., long-running computations
##D fib <- function(n) {
##D   if (n <= 1L) return(1L)
##D   Recall(n - 1) + Recall(n - 2)
##D }
##D fib <- firmly(fib, list("`n` capped at 30" ~ ceiling(n)) ~ {. <= 30L})
##D fib(21)  # [1] 17711 (NB: Validation done only once, not for every recursive call)
##D fib(31)  # Error: `n` capped at 30
##D 
##D # Apply fib unrestricted
##D loosely(fib)(31)  # [1] 2178309 (may take several seconds to finish)
##D 
##D # firmly won't force an argument that's not involved in checks
##D g <- firmly(function(x, y) "Pass", list(~x) ~ is.character)
##D g(c("a", "b"), stop("Not signaled"))  # [1] "Pass"
##D 
##D # In scripts and packages, it is recommended to use the operator %checkin%
##D vec_add <- list(
##D   ~is.numeric,
##D   list(~length(x) == length(y)) ~ isTRUE,
##D   .error_class = "inputError"
##D ) %checkin%
##D   function(x, y) {
##D     x + y
##D   }
##D 
##D # Or call firmly with .f explicitly assigned to the function
##D vec_add2 <- firmly(
##D   ~is.numeric,
##D   list(~length(x) == length(y)) ~ isTRUE,
##D   .f = function(x, y) {
##D     x + y
##D   },
##D   .error_class = "inputError"
##D )
##D 
##D all.equal(vec_add, vec_add2)  # [1] TRUE
## End(Not run)




