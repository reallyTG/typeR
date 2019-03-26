library(cliapp)


### Name: cli_dl
### Title: Definition list
### Aliases: cli_dl

### ** Examples

## Specifying the items at the beginning
cli_dl(c(foo = "one", bar = "two", baz = "three"))

## Adding items one by one
cli_dl()
cli_it(c(foo = "one"))
cli_it(c(bar = "two"))
cli_it(c(baz = "three"))
cli_end()



