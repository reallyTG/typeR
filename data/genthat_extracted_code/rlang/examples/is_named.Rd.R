library(rlang)


### Name: is_named
### Title: Is object named?
### Aliases: is_named is_dictionaryish have_name

### ** Examples

# A data frame usually has valid, unique names
is_named(mtcars)
have_name(mtcars)
is_dictionaryish(mtcars)

# But data frames can also have duplicated columns:
dups <- cbind(mtcars, cyl = seq_len(nrow(mtcars)))
is_dictionaryish(dups)

# The names are still valid:
is_named(dups)
have_name(dups)


# For empty objects the semantics are slightly different.
# is_dictionaryish() returns TRUE for empty objects:
is_dictionaryish(list())

# But is_named() will only return TRUE if there is a names
# attribute (a zero-length character vector in this case):
x <- set_names(list(), character(0))
is_named(x)


# Empty and missing names are invalid:
invalid <- dups
names(invalid)[2] <- ""
names(invalid)[5] <- NA

# is_named() performs a global check while have_name() can show you
# where the problem is:
is_named(invalid)
have_name(invalid)

# have_name() will work even with vectors that don't have a names
# attribute:
have_name(letters)



