
# ```````````````````````` #
#  Construct testing data  #
# ........................ #

# Load mass spectrometry data
load("../data/data-binMS.RData")

out_binMS_v1 <- binMS(testMS, "mtoz", "chg", "mass", "time", c("ms1", "ms2"),
             c(14, 45), c(2e3, 15e3), c(2, 10), 0.05, 1)

out_v1 <- format(out_binMS_v1)




# ````````````````````````````````````` #
#  Construct target results for out_v1  #
# ..................................... #

target_v1 <- list()

target_v1$newl <- "\n"

target_v1$incl <- paste0(
    "The inclusion criteria was specified as follows:\n",
    "------------------------------------------------\n",
    "    time of peak retention:  between    14 and     45\n",
    "    mass:                    between 2,000 and 15,000\n",
    "    charge:                  between     2 and     10\n",
    "\n")

target_v1$cons <- paste0(
    "m/z levels were consolidated when each of the following criteria were met:\n",
    "--------------------------------------------------------------------------\n",
    "    m/z levels were no more than 0.05 units apart\n",
    "    the time peak retention occured no farther apart than 1 units\n",
    "    the charge states were the same\n",
    "\n")

target_v1$size <- paste0(
    "The mass spectrometry data prior to binning had:\n",
    "------------------------------------------------\n",
    "    75 m/z levels\n",
    "\n")

target_v1$nrem <- paste0(
    "The number of remaining m/z levels after filtering by the inclusion criteria was:\n",
    "---------------------------------------------------------------------------------\n",
    "    time of peak retention:  69\n",
    "    mass:                    68\n",
    "    charge:                  68\n",
    "    satisfied all:           56\n",
    "\n")

target_v1$ntot  <- paste0(
    "After consolidating the m/z levels, there were:\n",
    "-----------------------------------------------\n",
    "    22 levels\n",
    "\n")

target_v1 <- unlist(target_v1)




# `````````````````````````````````````````` #
#  Construct out_v2 (a variation on out_v1)  #
# .......................................... #

# Temporarily construct as a list for convenience, will 'unlist' later
out_binMS_v2 <- out_binMS_v1

# Inclusion criteria
out_binMS_v2$summ_info$time_range[1L] <- 12.99
out_binMS_v2$summ_info$mass_range[2L] <- 101.1
out_binMS_v2$summ_info$charge_range[1L] <- -2.3

# Consolidation criteria
out_binMS_v2$summ_info$time_diff <- 1234.56

# Size prior to binning
out_binMS_v2$summ_info$n_tot <- 1055

# Individual filtering remaining
out_binMS_v2$summ_info$n_time_pr <- 1001

# Total remaining
out_binMS_v2$summ_info$n_binned <- 5678

out_v2 <- format(out_binMS_v2)




# ````````````````````````````````````` #
#  Construct target results for out_v2  #
# ..................................... #

# Temporarily construct as a list for convenience, will 'unlist' later
target_v2 <- list()

target_v2$newl <- "\n"

target_v2$incl <- paste0(
    "The inclusion criteria was specified as follows:\n",
    "------------------------------------------------\n",
    "    time of peak retention:  between    12.99 and  45  \n",
    "    mass:                    between 2,000    and 101.1\n",
    "    charge:                  between    -2.3  and  10  \n",
    "\n")

target_v2$cons <- paste0(
    "m/z levels were consolidated when each of the following criteria were met:\n",
    "--------------------------------------------------------------------------\n",
    "    m/z levels were no more than 0.05 units apart\n",
    "    the time peak retention occured no farther apart than 1,234.56 units\n",
    "    the charge states were the same\n",
    "\n")

target_v2$size <- paste0(
    "The mass spectrometry data prior to binning had:\n",
    "------------------------------------------------\n",
    "    1,055 m/z levels\n",
    "\n")

target_v2$nrem <- paste0(
    "The number of remaining m/z levels after filtering by the inclusion criteria was:\n",
    "---------------------------------------------------------------------------------\n",
    "    time of peak retention:  1,001\n",
    "    mass:                       68\n",
    "    charge:                     68\n",
    "    satisfied all:              56\n",
    "\n")

target_v2$ntot  <- paste0(
    "After consolidating the m/z levels, there were:\n",
    "-----------------------------------------------\n",
    "    5,678 levels\n",
    "\n")

target_v2 <- unlist(target_v2)




# ``````````````````````` #
#  Save data for testing  #
# ....................... #

save(out_v1, out_v2, target_v1, target_v2,
     file="tests/data/data-summary-binMS.RData")
