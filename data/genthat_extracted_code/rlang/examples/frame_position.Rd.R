library(rlang)


### Name: frame_position
### Title: Find the position or distance of a frame on the evaluation stack
### Aliases: frame_position
### Keywords: internal

### ** Examples

fn <- function() g(environment())
g <- function(env) frame_position(env)

# frame_position() returns the position of the frame on the evaluation stack:
fn()
identity(identity(fn()))

# Note that it trims off intervening calls before counting so you
# can safely nest it within other calls:
g <- function(env) identity(identity(frame_position(env)))
fn()

# You can also ask for the position from the current frame rather
# than the global frame:
fn <- function() g(environment())
g <- function(env) h(env)
h <- function(env) frame_position(env, from = "current")
fn()



