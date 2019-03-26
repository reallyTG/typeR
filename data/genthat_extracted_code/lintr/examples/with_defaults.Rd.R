library(lintr)


### Name: with_defaults
### Title: Modify the list of default linters
### Aliases: with_defaults

### ** Examples

# change the default line length cutoff
with_defaults(line_length_linter = line_length_linter(120))

# you can also omit the argument name if you are just using different
#   arguments.
with_defaults(line_length_linter(120))

# enforce camelCase rather than snake_case
with_defaults(camel_case_linter = NULL,
              snake_case_linter)



