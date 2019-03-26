
# Create a small data set imitating the form of mass spectrometry data prior to
# any binning or filtering; hand-construct a consolidated 'true' data set which
# is used to compare the results from the binning function against.
#
# Additionally create some derived forms of this first data set such as a
# data.frame version, data with missing values, and so on.
#
# Assume throughout the following settings for consolidation:
#
#   peak retention time:  14 - 45
#   mass:  2000 - 15000
#   charge: 2 - 10
#   mass-to-charge difference:  0.05
#   peak retention time difference:  1


# ``````````````````````````` #
#  Construct 1st set of data  #
# ........................... #

# Hand constructed test data.  Note that m/z and mass values do not agree (but
# this is okay, in the sense that agreement is not checked for in binMS).  See
# dimnames argument for the meaning of the columns.

test_dat_1 <- matrix(
  c(235,		4,	12,		  10,	
    235,		4,	23,		1000,	
    351.2053441,	2,	17.48105,	3000,	
    376.2374843,	3,	17.48105,	3000,	
    376.2874843, 	3,	17.51951667,	3000,	
    378.01,		5,	17.48,		3000,	
    378.03,		5,	17.48105,	3000,	
    378.06,		5,	17.51951667,	3000,	
    378.09,		5,	17.51951667,	3000,	
    379.01,		5,	17.51951667,	3000,	
    558.3226434,	1,	17.51951667,	3000,	
    563.2995933,	2,	17.51951667,	3000,	
    570.316981,		3,	17.51951667,	3000,	
    591.9828153,	1,	17.51951667,	3000,	
    626.2928755,	2,	17.51951667,	3000,	
    663.3549011,	3,	17.51951667,	3000,	
    665.3832214,	2,	17.51951667,	3000,	
    723.6040594,	2,	17.51951667,	3000,	
    1047.145919,	3,	22.35456667,	3000,	
    1047.323975,	8,	27.44611667,	3000),
  ncol = 4,
  byrow = TRUE,
  dimnames = list(NULL, c("mtoz", "chg", "time", "mass")))




# ``````````````````````````` #
#  Construct 2nd set of data  #
# ........................... #

# Construct 8 more bins of data, and some additional values do not meet the
# inclusion criteria.
#
# In more detail, the following section contructs 11 baseline combinations of
# values for mass, charge, time and mass-to-charge, of which 8 meet the
# inclusion criteria.  In a future section some observations will be sampled by
# adding small amounts of noise to the original baseline values.
#
# Values 1-8 are all valid and values 9-11 are invalid.
# Data in each row is constructed be in a different consolidation group from
# data sampled from another row (or to not be used), assuming small random
# perturbations of the data when sampling.
#
# Mass-to-charge ratio will be derived from mass and charge

baseline_dat <- matrix(
  c(# start with a set of values then change mass, charge, and peak time
    5000, 5, 20,
    6000, 5, 20,
    5000, 4, 20,
    5000, 5, 25,
    # start with a set of values then change mass, charge, and peak time
    8000, 5, 20,
    9000, 5, 20,
    9000, 4, 20,
    9000, 5, 25,
    # out-of-bounds choice of mass, charge, peak time
       0, 5, 20,
    9000, 1, 20,
    9000, 5,  0),
  dimnames=list(NULL, c("mass", "chg", "time")),
  ncol=3,
  byrow=TRUE)

# Parameters for use when sampling data
sd_mtoz <- 0.01
sd_time <- 0.2
n_repl <- 5L

# Sample n_repl samples for each row of baseline_dat.  Returns a (n_repl * 4) x
# nrow(baseline) matrix, where each column is a concatenated set of observations
# from the corresponding row of baseline_dat.  Recall that the relationship
# between m/z and mass is:
#
#   mass = (m/z - 1.007825) * charge

test_dat_2 <- apply(baseline_dat, 1, function(x)
  replicate(n_repl, {
    mtoz <- (x[["mass"]] / x[["chg"]]) + 1.007825 + rnorm(1, sd=sd_mtoz)
    mass <- (mtoz - 1.007825) * x[["chg"]]
    time <- x[["time"]] + rnorm(1, sd=sd_time)

    c(mtoz, x[["chg"]], time, mass)
  }))

# Reconfigure test_dat_2 so that each row is an observation
test_dat_2 <- matrix(c(test_dat_2),
                     ncol=4,
                     byrow=TRUE,
                     dimnames=list(NULL, c("mtoz", "chg", "time", "mass")))




# `````````````````````````````````````````````````` #
#  Construct test data by combining set 1 and set 2  #
# .................................................. #

# Combine the two sets of data created so far, i.e. test_dat_1 and test_dat_2,
# and add some mass spectrometry abundance data.  Note that the values chosen
# for the abundance data do not effect the consolidation of observations in
# binMS.

# Combine two datasets
testMS <- rbind(test_dat_1, test_dat_2)
# Create some mass spectrometry abundance data
ms_vals <- matrix(rep(1:2, each=(nrow(testMS))),
                  ncol=2,
                  dimnames=list(NULL, c("ms1", "ms2")))
# Combine test data and mass spectrometry abundance data
testMS <- cbind(testMS, ms_vals)




# ``````````````````````````````````` #
#  Hand calculate 'true' binned data  #
# ................................... #

# The object idx is a list with each element a vector providing the indices of a
# group of observations that belong to a bin.  The first line of code provides
# the indices for the groups in data set 1, and the second line of code provides
# the indices for the groups in data set 2.
#   
# Under the settings listed at the top of the file (i.e. the parameters to be
# passed to binMS()), the 2nd set of data was constructed so that there are 8
# bins, each consisting of a consecutive block of 5 observations.  I.e. the
# first bin consists of observations 1,...,5, the second bin consists of
# observations 6,...,10, etc. for the first 40 observations.  Observations
# 41,...,55 do not pass the inclusion criteria.  Then we shift the indices by
# nrow(test_dat_1) because we appended test_dat_2 to test_dat_1.

# Indices in data for each bin
idx <- c(list(3L, 4L, 5L, 6:8, 9L, 10L, 12L, 13L, 15L, 16L, 17L, 18L, 19L, 20L),
         lapply(1:8, function(j) seq(5 * (j - 1) + 1, 5 * j) + nrow(test_dat_1)))
                    
# Consolidate into bins
binDat <- sapply(idx, function(j) {
  # Take the averages of the observations for each variable
  this_bin <- colMeans(testMS[j, , drop=FALSE])
  # Change the average of the ms abundance data to a sum by multiplying
  this_bin[c("ms1", "ms2")] <- length(j) * this_bin[c("ms1", "ms2")]
  # Return consolidated group values
  this_bin
})
# Put data into observations by variables format
binDat <- t(binDat)
# Reorder the binned data so that bins go from smallest m/z to largest
binDat <- binDat[order(binDat[, "mtoz"], binDat[, "time"], binDat[, "chg"]), ]

# Construct msDat object
msDatObj <- msDat(binDat, "mtoz", "chg", c("ms1", "ms2"))
# Calculate whether the observations satisfy the criteria
time_pr_bool <- (14 <= testMS[, "time"]) & (testMS[, "time"] <= 45)
mass_bool <- (2000 <= testMS[, "mass"]) & (testMS[, "mass"] <= 15000)
charge_bool <- (2L <= testMS[, "chg"]) & (testMS[, "chg"] <= 10L)
# Construct summary function information
summ_info <- list(n_tot        = nrow(testMS),
                  n_time_pr    = sum(time_pr_bool),
                  n_mass       = sum(mass_bool),
                  n_charge     = sum(charge_bool),
                  n_tiMaCh     = sum(time_pr_bool & mass_bool & charge_bool),
                  n_binned     = nrow(binDat),
                  time_range   = c(14, 45),
                  mass_range   = c(2000, 15000),
                  charge_range = c(2, 10),
                  mtoz_diff    = 0.05,
                  time_diff    = 1)

# Construct 'true' consolidated object
true_bin <- list(msDatObj  = msDatObj,
                summ_info = summ_info)
class(true_bin) <- c("binMS", "msDat")




# ``````````````````````````````````````````````` #
#  Permute observations and add superfluous data  #
# ............................................... #

# Randomly permute the testMS data; the binning algorithm should be invariant
# to this
nr <- nrow(testMS)
testMS <- testMS[sample.int(nr, nr), ]

# Add some superfluous data columns to testMS
superfluous_data <- matrix(rnorm(2 * nr),
                           ncol = 2,
                           dimnames = list(NULL, c("extra_dat_1", "extra_dat_2")))
testMS <- cbind(testMS, superfluous_data)




# ``````````````````````````````````````` #
#  Additional objects for use in testing  #
# ....................................... #

# Create a data.frame, and add a character column
testdf <- data.frame(testMS)
testdf$extra_dat_3 <- "z"

# The number of columns with real data (i.e. cols 1:6)
n_datacols <- 6L

# Create length-1 vectors that are just a single NA
numer_NA <- replace(numeric(1), 1, NA_real_)
char_NA <- replace(character(1), 1, NA_character_)

# Create data with an NA in the mass spec abundances data
test_NA <- testMS
test_NA[1, "ms1"] <- NA_real_

# Create a data set without any column names
test_no_colnames <- testMS
colnames(test_no_colnames) <- NULL

# Create a data set with two columns that have the same name
test_dup_colnames <- testMS
colnames(test_dup_colnames)[2] <- "mtoz"




# ````````````````````````````````````````````` #
#  Save data to file for use by testing script  #
# ............................................. #

save(testMS, testdf, test_NA, test_no_colnames, test_dup_colnames, true_bin,
     numer_NA, char_NA, n_datacols, file="tests/data/data-binMS.RData")
