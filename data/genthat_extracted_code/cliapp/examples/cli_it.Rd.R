library(cliapp)


### Name: cli_it
### Title: CLI list item(s)
### Aliases: cli_it

### ** Examples

## Adding items one by one
cli_ul()
cli_it("one")
cli_it("two")
cli_it("three")
cli_end()

## Complex item, added gradually.
cli_ul()
cli_it()
cli_verbatim("Beginning of the {emph first} item")
cli_text("Still the first item")
cli_end()
cli_it("Second item")
cli_end()



