library(messaging)


### Name: emit_warning
### Title: Provide a warning with a consistent format
### Aliases: emit_warning

### ** Examples

## Not run: 
##D # Write a function that yields a warning with
##D # the requested number of info lines
##D yield_a_warning <- function(msgs) {
##D 
##D   if (msgs > 3) msgs <- 3
##D 
##D   # Create some strings can serve as additional
##D   # info for the message
##D   message_components <-
##D     c("* message info 1",
##D       "* message info 2",
##D       "* message info 3")
##D 
##D   # Generate and emit a formatted message
##D   emit_warning(
##D     "There (is/are) {number} thing(s) to note",
##D     message_components[1:msgs],
##D     number = msgs,
##D     .format = "{.f_name} info: {text}")
##D }
##D 
##D # When that function is called, a formatted
##D # message will appear; here are some examples:
##D yield_a_warning(msgs = 3)
##D #> Warning message:
##D #> `yield_a_warning()` info: There are 3 things to note
##D #> * message info 1
##D #> * message info 2
##D #> * message info 3
##D 
##D yield_a_warning(msgs = 2)
##D #> Warning message:
##D #> `yield_a_warning()` info: There are 2 things to note
##D #> * message info 1
##D #> * message info 2
##D 
##D yield_a_warning(msgs = 1)
##D #> Warning message:
##D #> `yield_a_warning()` info: There is 1 thing to note
##D #> * message info 1
## End(Not run)



