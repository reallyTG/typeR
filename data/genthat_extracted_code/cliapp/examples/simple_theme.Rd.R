library(cliapp)


### Name: simple_theme
### Title: A simple CLI theme
### Aliases: simple_theme

### ** Examples

cli_div(theme = cliapp::simple_theme())

cli_h1("Header 1")
cli_h2("Header 2")
cli_h3("Header 3")

cli_alert_danger("Danger alert")
cli_alert_warning("Warning alert")
cli_alert_info("Info alert")
cli_alert_success("Success alert")
cli_alert("Alert for starting a process or computation",
  class = "alert-start")

cli_text("Packages and versions: {pkg cliapp} {version 1.0.0}.")
cli_text("Time intervals: {timestamp 3.4s}")

cli_text("{emph Emphasis} and  {strong strong emphasis}")

cli_text("This is a piece of code: {code sum(x) / length(x)}")
cli_text("Function names: {fun cliapp::simple_theme} and {arg arguments}.")

cli_text("Files: {file /usr/bin/env}")
cli_text("URLs: {url https://r-project.org}")

cli_h2("Longer code chunk")
cli_par(class = "r-code")
cli_verbatim(
  '# window functions are useful for grouped mutates',
  'mtcars %>%',
  '  group_by(cyl) %>%',
  '  mutate(rank = min_rank(desc(mpg)))')
cli_end()

cli_h2("Even longer code chunk")
cli_par(class = "r-code")
cli_verbatim(format(ls))
cli_end()

cli_end()



