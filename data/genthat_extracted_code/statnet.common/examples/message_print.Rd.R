library(statnet.common)


### Name: message_print
### Title: 'print' objects to the 'message' output.
### Aliases: message_print

### ** Examples

cat(1:5)

print(1:5)
message_print(1:5) # Looks the same (though may be in a different color on some frontends).

suppressMessages(print(1:5)) # Still prints
suppressMessages(message_print(1:5)) # Silenced



