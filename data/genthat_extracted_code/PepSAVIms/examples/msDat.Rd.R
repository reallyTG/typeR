library(PepSAVIms)


### Name: msDat
### Title: Constructor for class 'msDat'
### Aliases: msDat

### ** Examples


# Load mass spectrometry data
data(mass_spec)

# Convert mass_spec from a data.frame to an msDat object
ms <- msDat(mass_spec = mass_spec,
            mtoz = "m/z",
            charge = "Charge",
            ms_inten = c(paste0("_", 11:43), "_47"))

# Dimension of the data
dim(ms)

# Print the first few rows and columns
ms[1:5, 1:2]

# Let's change the fraction names to something more concise
colnames(ms) <- c(paste0("frac", 11:43), "frac47")

# Print the first few rows and columns with the new fraction names
ms[1:5, 1:8]

# Suppose there are some m/z levels that we wish to remove
ms <- ms[-c(2, 4), ]
# Print the first few rows and columns after removing rows 2 and 4
ms[1:5, 1:8]

# Suppose that there was an instrumentation error and that we need to change
# some values
ms[1, paste0("frac", 12:17)] <- c(55, 57, 62, 66, 71, 79)
# Print the first few rows and columns after changing some of the values in
# the first row
ms[1:5, 1:10]




