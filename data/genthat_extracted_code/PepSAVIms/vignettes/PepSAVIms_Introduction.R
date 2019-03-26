## ----setup, cache=FALSE, include=FALSE--------------------------------------------------
library(knitr)
knit_theme$set("default")
opts_chunk$set(cache=FALSE)
opts_knit$set(root.dir=normalizePath(".."))
options(width=90)

## ----reading-data-ms--------------------------------------------------------------------
# Load package into memory
library(PepSAVIms)

# The mass spectrometry data is provided as a data.frame
is.data.frame(mass_spec)

# There are 30,799 mass-to-charge levels, and 38 variables
dim(mass_spec)

# The first four variables provide the m/z level, time of peak retention, mass,
# and charge state of each observation.  The remaining 34 variables are the mass
# spectrometric intensities for each compound across fractions 11 through 43, and fraction 47.
names(mass_spec)

## ----reading-data-bio-------------------------------------------------------------------
# Load data into memory
data(bioact)

# bioact is a list with each element corresponding to bioactivity data
is.list(bioact)

# Names of the elements in bioact
names(bioact)

# Arbitrarily select one of the datasets for further examples
EC <- bioact$ec

# EC is provided as a data.frame
is.data.frame(EC)

# EC contains data for 3 replicates and 44 fractions
dim(EC)

# The names of the fractions for which bioactivity observations were obtained
names(EC)

## ----consolidating-data-names-----------------------------------------------------------

# Perform consolidation using names
bin_out <- binMS(mass_spec = mass_spec,
                 mtoz = "m/z",
                 charge = "Charge",
                 mass = "Mass",
                 time_peak_reten = "Reten",
                 ms_inten = NULL,
                 time_range = c(14, 45),
                 mass_range = c(2000, 15000),
                 charge_range = c(2, 10),
                 mtoz_diff = 0.05,
                 time_diff = 60)

## ----consolidating-data-all-------------------------------------------------------------

# Make copies of some of the vectors in mass_spec to pass directly to function
mass_vals   <- mass_spec[, "Mass"]
time_vals   <- mass_spec[, "Retention time (min)"]

# Vector of names for the intensity columns.  We include the leading underscore
# so as to prevent any ambiguity between the fraction number and date.
inten_nm <- c(paste0("_", 11:43), "_47")

# Perform consolidation alternate input
bin_out_v2 <- binMS(mass_spec = mass_spec,
                    mtoz = "m/z",
                    charge = "Charge",
                    mass = mass_vals,
                    time_peak_reten = time_vals,
                    ms_inten = inten_nm,
                    time_range = c(14, 45),
                    mass_range = c(2000, 15000),
                    charge_range = c(2, 10),
                    mtoz_diff = 0.05,
                    time_diff = 60)

# We get the same results whether specifying data via column names or column
# indices
identical(bin_out_v2, bin_out)

## ----consolidating-data-summary---------------------------------------------------------
# Print the size of the consolidated data
bin_out

# Show summary information describing the consolidation process
summary(bin_out)

## ----filtering-data-names---------------------------------------------------------------

# Invoke filterMS using column names to specify the region of interest
filter_out <- filterMS(msObj = bin_out,
                       region = paste0("VO_", 17:25),
                       border = "all",
                       bord_ratio = 0.01,
                       min_inten = 1000,
                       max_chg = 10)

# The column indices 7-15 correspond to fractions 17-25
colnames(filter_out)[7:15]

# Invoke filterMS using indices to specify the region of interest
filter_out_v2 <- filterMS(msObj = bin_out,
                          region = 7:15,
                          border = "all",
                          bord_ratio = 0.01,
                          min_inten = 1000,
                          max_chg = 10)

# Confirm that the two objects are equivalent
identical(filter_out_v2, filter_out)

## ----filtering-data-border--------------------------------------------------------------

# Use one value to specify the width of both the left and the right bordering
# region
filter_out_v3 <- filterMS(msObj = bin_out,
                          region = paste0("VO_", 17:25),
                          border = 100,
                          bord_ratio = 0.01,
                          min_inten = 1000,
                          max_chg = 10)

# Use two values to specify the left width and right width of the bordering
# region
filter_out_v4 <- filterMS(msObj = bin_out,
                          region = paste0("VO_", 17:25),
                          border = c(150, 200),
                          bord_ratio = 0.01,
                          min_inten = 1000,
                          max_chg = 10)

# We get the same result be specifying the left and right bordering regions as
# having widths 100 as by choosing "all"
identical(filter_out_v3$msDatObj, filter_out$msDatObj)

# We get the same result be specifying the left and right bordering regions as
# having widths 150 and 200 as by choosing "all"
identical(filter_out_v4$msDatObj, filter_out$msDatObj)

## ----filtering-data-summary-------------------------------------------------------------
# Print the size of the filtered data
filter_out

# Show summary information describing the filtering process
summary(filter_out)

## ----ranking-data-names-----------------------------------------------------------------
# Perform the candidate ranking procedure with fractions 21-24 as the region of
# interest
rank_out <- rankEN(msObj = filter_out,
                   bioact = EC,
                   region_ms = paste0("_", 21:24),
                   region_bio = paste0("_", 21:24),
                   lambda = 0.001,
                   pos_only = TRUE,
                   ncomp = NULL)

## ----ranking-data-summary---------------------------------------------------------------
# Prints the dimensions of the data
rank_out

# Shows the first 10 candidate compounds obtained by the procedure
summary(rank_out, 10)

## ----ranking-data-compounds-------------------------------------------------------------
# Extract the ranked candidates
ranked_candidates <- extract_ranked(rank_out)

# Return object is a data.frame
is.data.frame(ranked_candidates)

# Print first few candidates; should be the same as from the summary function
head(ranked_candidates)

## ----extractMS-matrix-------------------------------------------------------------------

# Refactor the data as a matrix
filter_matr <- extractMS(msObj = filter_out, type = "matrix")

# Return object is a matrix
is.matrix(filter_matr)

# The data has two extra columns, one each for the m/z and charge information
dim(filter_matr)

# Compare to the result of calling dim on the original msDat object
dim(filter_out)

# Print the first few rows and columns of the newly formed matrix.  The row
# names of the matrix are the concatonation of the mass-to-charge ratio and
# charge state, separated by a /.
filter_matr[1:5, 1:4]

## ----extractMS-matrix-export, eval=FALSE------------------------------------------------
#  # Save the data as a csv file.  Probably don't want to keep the row names as that
#  # information is contained in the first two columns of the data.
#  write.csv(filter_matr, file = "filtered_mass_spec.csv", row.names = FALSE)

## ----extractMS-msDat--------------------------------------------------------------------
# Extract the encapsulated msDat object
filter_msDat <- extractMS(filter_out, "msDat")

# For a subclass of msDat the extractMS function has the effect of performing
# the following command
filter_msDat_v2 <- filter_out$msDatObj

# extractMS is the same as copying the msDatObj element for a subclass of msDat
identical(filter_msDat_v2, filter_msDat)

# Calling extractMS on an object that is strictly of class msDat is effectively
# a noop
filter_msDat_v3 <- extractMS(filter_msDat, "msDat")

# extractMS on a strictly msDat object returns the original object
identical(filter_msDat_v3, filter_msDat)

# Printing the extracted msDat object prints the intensity matrix (as opposed to
# the print function for binMS or filterMS objects.  Also compare this to the
# extracted matrix in the previous section: in this form the mass-to-charge and
# charge data is not exposed to the user.
filter_msDat[1:5, 1:2]

## ----msDat------------------------------------------------------------------------------

# Construct an msDat object from object created by a call to extractMS
filter_out_v5 <- msDat(mass_spec = filter_matr,
                       mtoz = "mtoz",
                       charge = "charge",
                       ms_inten = NULL)

# Confirm that reconstructed msDat object is equal.  Need to ignore attributes
# when testing for equality b/c row names are not retained.
all.equal(filter_out_v5, filter_out$msDatObj, check.attributes=FALSE)


## ----msDat-API--------------------------------------------------------------------------

# Check the dimension; can also use nrow, ncol
dim(filter_msDat)

# Print the first few rows and columns
filter_msDat[1:5, 1:3]

# Let's change the fraction names to something more concise
colnames(filter_msDat) <- c(paste0("frac", 11:43), "frac47")

# Print the first few rows and columns with the new fraction names
filter_msDat[1:5, 1:10]

# Suppose there are some m/z levels that we wish to remove
filter_msDat <- filter_msDat[-c(2, 4), ]

# Print the first few rows and columns after removing rows 2 and 4
filter_msDat[1:5, 1:10]

# Suppose that there was an instrumentation error and that we need to change
# some values
filter_msDat[1, paste0("frac", 12:17)] <- c(55, 57, 62, 66, 71, 79)

# Print the first few rows and columns after changing some of the values in
# the first row
filter_msDat[1:5, 1:10]

