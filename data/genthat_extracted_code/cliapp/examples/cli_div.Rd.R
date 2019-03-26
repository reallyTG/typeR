library(cliapp)


### Name: cli_div
### Title: Generic CLI container
### Aliases: cli_div

### ** Examples

## div with custom theme
d <- cli_div(theme = list(h1 = list(color = "blue",
                                    "font-weight" = "bold")))
cli_h1("Custom title")
cli_end(d)

## Close automatically
div <- function() {
  cli_div(class = "tmp", theme = list(.tmp = list(color = "yellow")))
  cli_text("This is yellow")
}
div()
cli_text("This is not yellow any more")



