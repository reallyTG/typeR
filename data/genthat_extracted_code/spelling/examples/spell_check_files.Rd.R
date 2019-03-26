library(spelling)


### Name: spell_check_files
### Title: Spell Check
### Aliases: spell_check_files spell_check_text

### ** Examples

# Example files
files <- list.files(system.file("examples", package = "knitr"),
  pattern = "\\.(Rnw|Rmd|html)$", full.names = TRUE)
spell_check_files(files)



