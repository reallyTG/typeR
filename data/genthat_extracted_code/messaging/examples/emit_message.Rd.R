library(messaging)


### Name: emit_message
### Title: Provide a message with a consistent format
### Aliases: emit_message

### ** Examples

# Write a function that yields a message with
# the requested number of info lines
yield_a_message <- function(msgs) {

  if (msgs > 3) msgs <- 3

  # Create some strings can serve as additional
  # info for the message
  message_components <-
    c("* message info 1",
      "* message info 2",
      "* message info 3")

  # Generate and emit a formatted message
  emit_message(
    "There (is/are) {number} thing(s) to note",
    message_components[1:msgs],
    number = msgs,
    .format = "{.f_name} info: {text}")
}

# When that function is called, a formatted
# message will appear; here are some examples:
yield_a_message(msgs = 3)

yield_a_message(msgs = 2)

yield_a_message(msgs = 1)



