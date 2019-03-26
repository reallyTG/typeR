library(flextable)


### Name: hyperlink_text
### Title: hyperlink wrapper
### Aliases: hyperlink_text

### ** Examples

dat <- data.frame(
  col = "CRAN website", href = "https://cran.r-project.org",
  stringsAsFactors = FALSE)

ft <- flextable(dat)
ft <- display(
  ft, col_key = "col", pattern = "# {{mylink}}",
  formatters = list(mylink ~ hyperlink_text(href, col) )
)
ft


dat <- data.frame(
  col = "Google it",
  href = "https://www.google.fr/search?source=hp&q=officer+R+package",
  stringsAsFactors = FALSE)

ft <- flextable(dat)
ft <- display( x = ft,
  col_key = "col",
  pattern = "This is a link: {{mylink}}",
  formatters = list(mylink ~ hyperlink_text(href, col) ) )
ft



