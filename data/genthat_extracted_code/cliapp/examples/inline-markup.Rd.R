library(cliapp)


### Name: inline-markup
### Title: CLI inline markup
### Aliases: inline-markup

### ** Examples

## Some inline markup examples
cli_ul()
cli_it("{emph Emphasized} text")
cli_it("{strong Strong} importance")
cli_it("A piece of code: {code sum(a) / length(a)}")
cli_it("A package name: {pkg cliapp}")
cli_it("A function name: {fun cli_text}")
cli_it("A function argument: {arg text}")
cli_it("A keyboard key: press {key ENTER}")
cli_it("A file name: {file /usr/bin/env}")
cli_it("An email address: {email bugs.bunny@acme.com}")
cli_it("A URL: {url https://acme.com}")
cli_it("A variable name: {var mtcars}")
cli_it("An environment variable: {envvar R_LIBS}")
cli_end()

## Adding a new class
cli_div(theme = list(
  span.myclass = list(color = "lightgrey"),
  "span.myclass::before" = list(content = "["),
  "span.myclass::after" = list(content = "]")))
cli_text("This is {myclass in brackets}.")
cli_end()



