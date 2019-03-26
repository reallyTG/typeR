library(rlang)


### Name: cnd_muffle
### Title: Muffle a condition
### Aliases: cnd_muffle

### ** Examples

fn <- function() {
  inform("Beware!", "my_particular_msg")
  inform("On your guard!")
  "foobar"
}

# Let's install a muffling handler for the condition thrown by `fn()`.
# This will suppress all `my_particular_wng` warnings but let other
# types of warnings go through:
with_handlers(fn(),
  my_particular_msg = calling(function(cnd) {
    inform("Dealt with this particular message")
    cnd_muffle(cnd)
  })
)

# Note how execution of `fn()` continued normally after dealing
# with that particular message.

# cnd_muffle() can also be passed to with_handlers() as a calling
# handler:
with_handlers(fn(),
  my_particular_msg = calling(cnd_muffle)
)



