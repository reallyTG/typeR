library(poio)


### Name: fix_metadata
### Title: Fix metadata in a PO object
### Aliases: fix_metadata fix_metadata.data.frame fix_metadata.po

### ** Examples

pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
pot <- read_po(pot_file)
pot_fixed <- fix_metadata(pot, system.file(package = "poio"))

# Choose your own metadata
pot_fixed2 <- fix_metadata(
  pot,
  system.file(package = "poio"),
  "Last-Translator" = "Dr. Daniel Jackson <djackson@stargate.com>",
  .dots  = list(
    "Language-Team" = "Team RL10N!"
  )
)

# Compare the metadata before and after
pot$metadata
pot_fixed$metadata



