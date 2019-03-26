library(pointblank)


### Name: set_email_prefs
### Title: Set email credentials and enable email reporting
### Aliases: set_email_prefs

### ** Examples

## Not run: 
##D # Generate an email credentials
##D # file using the function
##D # `create_email_creds_file()`
##D create_email_creds_file(
##D   file = "~/.pb_email",
##D   sender = "point@blank.org",
##D   host = "smtp.blank.org",
##D   port = 465,
##D   user = "point@blank.org",
##D   password = "************") 
##D 
##D # Create a simple data frame
##D # with a column of numerical values
##D df <-
##D   data.frame(
##D     a = c(5, 7, 6, 5, 8, 7))
##D 
##D # Create a pointblank `agent`,
##D # set up the email notification
##D # preferences, and conduct a
##D # simple validation; because
##D # `notify_count` (in the step
##D # where `col_vals_lt()` is called)
##D # has a value of `1` the
##D # `email_recipients` will be
##D # notified when there are one or
##D # more non-passing validations (in
##D # this case, non-passing rows)
##D agent <-
##D   create_agent() %>%
##D   set_email_prefs(
##D     notify_active = TRUE,
##D     email_recipients = 
##D       c("a@b.net", "c@d.com"),
##D     creds_file = "~/.pb_email") %>%
##D   focus_on(tbl_name = "df") %>%
##D   col_vals_lt(
##D     column = a,
##D     value = 6,
##D     notify_count = 1) %>%
##D   interrogate()
## End(Not run)



