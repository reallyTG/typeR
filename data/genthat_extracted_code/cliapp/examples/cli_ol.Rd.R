library(cliapp)


### Name: cli_ol
### Title: Ordered CLI list
### Aliases: cli_ol

### ** Examples

## Specifying the items at the beginning
cli_ol(c("one", "two", "three"))

## Adding items one by one
cli_ol()
cli_it("one")
cli_it("two")
cli_it("three")
cli_end()

## Nested lists
cli_div(theme = list(ol = list("margin-left" = 2)))
cli_ul()
cli_it("one")
cli_ol(c("foo", "bar", "foobar"))
cli_it("two")
cli_end()
cli_end()



