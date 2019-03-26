library(damr)


### Name: load_dam
### Title: Load DAMS data from one or several continuous text files
### Aliases: load_dam load_dam2

### ** Examples

# This is where our toy data lives
root_dir <- damr_example_dir()

# Metadata already made for us.
# It defines condition and genotype of each animal
data(single_file_metadata)
print(single_file_metadata)
# Linking:
metadata <- link_dam_metadata(single_file_metadata, root_dir)

# We find and load the matching data
dt <- load_dam(metadata)
print(dt)
# An example of the use of FUN,
# we load only the first few reads by run `head()` on each animal,
# on the fly (no pun intended)
dt <- load_dam(metadata, FUN = head)
print(dt)



