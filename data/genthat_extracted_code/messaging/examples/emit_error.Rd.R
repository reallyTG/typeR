library(messaging)


### Name: emit_error
### Title: Stop function and provide associated messages
### Aliases: emit_error

### ** Examples

## Not run: 
##D # Write a function that stops the function
##D # with a message with the requested number
##D # of info lines
##D yield_an_error <- function(msgs) {
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
##D   emit_error(
##D     "There (is/are) {number} thing(s) to note",
##D     message_components[1:msgs],
##D     number = msgs,
##D     .format = "{.f_name} info: {text}")
##D }
##D 
##D # When that function is called, a formatted
##D # message will appear; here are some examples:
##D yield_an_error(msgs = 3)
##D #> Error: `yield_an_error()` info: There are 3 things to note
##D #> * message info 1
##D #> * message info 2
##D #> * message info 3
##D 
##D yield_an_error(msgs = 2)
##D #> Error: `yield_an_error()` info: There are 2 things to note
##D #> * message info 1
##D #> * message info 2
##D 
##D yield_an_error(msgs = 1)
##D #> Error: `yield_an_error()` info: There is 1 thing to note
##D #> * message info 1
## End(Not run)



