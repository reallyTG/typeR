library(rlang)


### Name: catch_cnd
### Title: Catch a condition
### Aliases: catch_cnd

### ** Examples

catch_cnd(10)
catch_cnd(abort("an error"))
catch_cnd(cnd_signal("my_condition", .msg = "a condition"))



