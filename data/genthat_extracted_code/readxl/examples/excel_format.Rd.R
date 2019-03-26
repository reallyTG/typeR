library(readxl)


### Name: excel_format
### Title: Determine file format
### Aliases: excel_format format_from_ext format_from_signature

### ** Examples

files <- c(
  "a.xlsx",
  "b.xls",
  "c.png",
  file.path(R.home("doc"), "html", "logo.jpg"),
  readxl_example("clippy.xlsx"),
  readxl_example("deaths.xls")
)
excel_format(files)



