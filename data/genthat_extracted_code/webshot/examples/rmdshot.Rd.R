library(webshot)


### Name: rmdshot
### Title: Take a snapshot of an R Markdown document
### Aliases: rmdshot

### ** Examples

if (interactive()) {
  # rmdshot("rmarkdown_file.Rmd", "snapshot.png")

  # R Markdown file
  input_file <- system.file("examples/knitr-minimal.Rmd", package = "knitr")
  rmdshot(input_file, "minimal_rmd.png")

  # Shiny R Markdown file
  input_file <- system.file("examples/shiny.Rmd", package = "webshot")
  rmdshot(input_file, "shiny_rmd.png", delay = 5)
}




