library(ensurer)


### Name: check_that
### Title: Ensure Certain Conditions for a Value at Runtime.
### Aliases: check check_that ensure ensure_that ensures ensures_that

### ** Examples

## Not run: 
##D 
##D ensure_that(1:10, is.integer)
##D 
##D # Examples below will use the magrittr pipe
##D library(magrittr)
##D 
##D # Create a contract which can ensure that a matrix is square.
##D ensure_square <- ensures_that(NCOL(.) == NROW(.))
##D 
##D # apply it.
##D A <-
##D   diag(4) %>%
##D   ensure_square
##D 
##D # Without the pipe operator:
##D A <- ensure_square(diag(4))
##D 
##D # Ensure on the fly (this will pass the test)
##D A <-
##D   matrix(runif(16), 4, 4) %>%
##D   ensure_that(ncol(.) == nrow(.), all(. <= 1))
##D 
##D # This will raise an error
##D A <-
##D   matrix(NA, 4, 4) %>%
##D   ensure_that(. %>% anyNA %>% not)
##D 
##D # Tweak failure:
##D A <-
##D   1:10 %>%
##D   ensure_that(all(. < 5), err_desc = "Number tests!")
##D 
##D # A default value for failure situations:
##D A <-
##D   1:10 %>%
##D   ensure_that(all(. < 5), fail_with = NA)
##D 
##D # Suppose you had an email function:
##D email_err <- function(e) {email(e$message); stop(e)}
##D 
##D A <-
##D   1:10 %>%
##D   ensure_that(all(. < 5), fail_with = email_err)
##D 
##D # Two similar contracts, one extending the other.
##D # Note also that custom message is used for A
##D A <- ensures_that(all(.) > 0 ~ "Not all values are positive")
##D B <- ensures_that(!any(is.na(.)) ~ "There are missing values", +A)
##D 
##D B(c(-5:5, NA))
## End(Not run)



