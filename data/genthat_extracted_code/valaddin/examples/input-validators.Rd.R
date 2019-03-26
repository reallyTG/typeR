library(valaddin)


### Name: input-validators
### Title: Generate input-validation checks
### Aliases: input-validators localize globalize

### ** Examples

chk_pos_gbl <- "Not positive" ~ {. > 0}
chk_pos_lcl <- localize(chk_pos_gbl)
chk_pos_lcl(~x, "y not greater than x" ~ x - y)
# list("Not positive: x" ~ x, "y not greater than x" ~ x - y) ~ {. > 0}

# localize and globalize are mutual inverses
identical(globalize(localize(chk_pos_gbl)), chk_pos_gbl)  # [1] TRUE
all.equal(localize(globalize(chk_pos_lcl)), chk_pos_lcl)  # [1] TRUE

## Not run: 
##D 
##D pass <- function(x, y) "Pass"
##D 
##D # Impose local positivity checks
##D f <- firmly(pass, chk_pos_lcl(~x, "y not greater than x" ~ x - y))
##D f(2, 1)  # [1] "Pass"
##D f(2, 2)  # Error: "y not greater than x"
##D f(0, 1)  # Errors: "Not positive: x", "y not greater than x"
##D 
##D # Or just check positivity of x
##D g <- firmly(pass, chk_pos_lcl(~x))
##D g(1, 0)  # [1] "Pass"
##D g(0, 0)  # Error: "Not positive: x"
##D 
##D # In contrast, chk_pos_gbl checks positivity for all arguments
##D h <- firmly(pass, chk_pos_gbl)
##D h(2, 2)  # [1] "Pass"
##D h(1, 0)  # Error: "Not positive: `y`"
##D h(0, 0)  # Errors: "Not positive: `x`", "Not positive: `y`"
##D 
##D # Alternatively, globalize the localized checker
##D h2 <- firmly(pass, globalize(chk_pos_lcl))
##D all.equal(h, h2)  # [1] TRUE
##D 
##D # Use localize to make parameterized checkers
##D chk_lte <- function(n, ...) {
##D   err_msg <- paste("Not <=", as.character(n))
##D   localize(err_msg ~ {. <= n})(...)
##D }
##D fib <- function(n) {
##D   if (n <= 1L) return(1L)
##D   Recall(n - 1) + Recall(n - 2)
##D }
##D capped_fib <- firmly(fib, chk_lte(30, ~ ceiling(n)))
##D capped_fib(19)  # [1] 6765
##D capped_fib(31)  # Error: "Not <= 30: ceiling(n)"
## End(Not run)




