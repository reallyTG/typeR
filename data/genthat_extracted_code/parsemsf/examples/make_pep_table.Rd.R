library(parsemsf)


### Name: make_pep_table
### Title: Make a data frame of peptides
### Aliases: make_pep_table

### ** Examples

# Read from a path

make_pep_table(parsemsf_example("test_db.msf"))

# Retrieve full protein description

make_pep_table(parsemsf_example("test_db.msf"), prot_regex = "")

# ...which is also equivalent to...

make_pep_table(parsemsf_example("test_db.msf"), prot_regex = "^(.+)$")




