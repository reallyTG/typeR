library(rlang)


### Name: cnd
### Title: Create a condition object
### Aliases: cnd error_cnd warning_cnd message_cnd

### ** Examples

# Create a condition inheriting from the s3 type "foo":
cnd <- cnd("foo")

# Signal the condition to potential handlers. Since this is a bare
# condition the signal has no effect if no handlers are set up:
cnd_signal(cnd)

# When a relevant handler is set up, the signal causes the handler
# to be called:
with_handlers(cnd_signal(cnd), foo = exiting(function(c) "caught!"))

# Handlers can be thrown or executed inplace. See with_handlers()
# documentation for more on this.

# Signalling an error condition aborts the current computation:
err <- error_cnd("foo", message = "I am an error")
try(cnd_signal(err))



