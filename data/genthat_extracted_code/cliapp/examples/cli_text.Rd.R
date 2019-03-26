library(cliapp)


### Name: cli_text
### Title: CLI text
### Aliases: cli_text

### ** Examples

cli_text("Hello world!")
cli_text(packageDescription("cliapp")$Description)

## Arguments are concatenated
cli_text("this", "that")

## Command substitution
greeting <- "Hello"
subject <- "world"
cli_text("{greeting} {subject}!")

## Inline theming
cli_text("The {fun cli_text} function in the {pkg cliapp} package")

## Use within container elements
ul <- cli_ul()
cli_it()
cli_text("{emph First} item")
cli_it()
cli_text("{emph Second} item")
cli_end(ul)



