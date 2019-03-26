library(poio)


### Name: generate_po_from_pot
### Title: Generate a PO object from a POT object
### Aliases: generate_po_from_pot generate_po_from_pot.po

### ** Examples

pot_file <- system.file("extdata/R-summerof69.pot", package = "poio")
pot <- read_po(pot_file)
# It's a good idea to fix the metadata before you generate the PO files
pot_fixed <- fix_metadata(pot, system.file(package = "poio"))

# Call generate_po_from_pot for each language that you want to translate to
two_pos <- lapply(
  c(German = "de", Qatari_Arabic = "ar_QA"),
  generate_po_from_pot,
  x = pot_fixed
)

# Notice the Language and Plural-forms elements in the metadata
two_pos$German$metadata
# Also notice that the countable msgstr elements for Arabic now
# have length 6, since Arabic has 6 plural forms
two_pos$Qatari_Arabic$countable$msgstr



