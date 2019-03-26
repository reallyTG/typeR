library(rlang)


### Name: quo_squash
### Title: Squash a quosure
### Aliases: quo_squash

### ** Examples

# Quosures can contain nested quosures:
quo <- quo(wrapper(!!quo(wrappee)))
quo

# quo_squash() flattens all the quosures and returns a simple expression:
quo_squash(quo)



