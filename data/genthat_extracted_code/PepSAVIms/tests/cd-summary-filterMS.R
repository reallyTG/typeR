
# ``````````````````` #
#  Load testing data  #
# ................... #

# Load mass spectrometry data
load("../data/data-filterMS.RData")

# Construct filterMS objects
out_filterMS <- filterMS(msDatObj, paste0("frac", 3:4), "all", 0.05, 1000, 7L)
out_filterMS_bord_none <- filterMS(msDatObj, paste0("frac", 3:4), "none", 0.05, 1000, 7L)
out_filterMS_bord_1val <- filterMS(msDatObj, paste0("frac", 3:4), 0, 0.05, 1000, 7L)
out_filterMS_bord_2val <- filterMS(msDatObj, paste0("frac", 3:4), c(1, 99), 0.05, 1000, 7L)
out_filterMS_nfinal_none <- filterMS(msDatObj, paste0("frac", 3:4), c(1, 99), 0.05, 1e9, 7L)

# Obtain summary output in string form
out_v1 <- format(out_filterMS)
out_bord_none <- format(out_filterMS_bord_none)
out_bord_1val <- format(out_filterMS_bord_1val)
out_bord_2val <- format(out_filterMS_bord_2val)
out_nfinal_none <- format(out_filterMS_nfinal_none)




# ````````````````````````````````````` #
#  Construct target results for out_v1  #
# ..................................... #

target_v1 <- list()

target_v1$newl <- "\n"

target_v1$regn <- paste0(
    "The region of interest was specified as (2 fractions):\n",
    "------------------------------------------------------\n",
    "    frac3\n",
    "    frac4\n",
    "\n")

target_v1$bord <- paste0(
    "The bordering regions were specified as \"all\"\n",
    "---------------------------------------------\n",
    "    frac1\n",
    "    frac2\n",
    "    frac5\n",
    "    frac6\n",
    "\n")

target_v1$fcri <- paste0(
    "The filtering criteria was specified as:\n",
    "----------------------------------------\n",
    "    minimum intensity:      1,000   \n",
    "    maximum charge:             7   \n",
    "    bordering region ratio:     0.05\n",
    "\n")

target_v1$prir <- paste0(
    "The mass spectrometry data prior to filtering had:\n",
    "--------------------------------------------------\n",
    "    24 compounds\n",
    "     6 fractions\n",
    "\n")

target_v1$frem <- paste0(
    "Individually, each criterion reduced the 24 m/z levels to the following number:\n",
    "-------------------------------------------------------------------------------\n",
    "    criterion 1:  20    (fraction with max. abundance is in region of interest)\n",
    "    criterion 2:  13    (fractions in bordering region have < 5 of max. abundance)\n",
    "    criterion 3:  18    (nonzero abundance in right adjacent fraction to max.)\n",
    "    criterion 4:  20    (at least 1 intensity > 1,000 in region of interest)\n",
    "    criterion 5:  20    (must have charge <= 7)\n",
    "\n")

target_v1$ffin <- paste0(
    "The total number of candidate compounds was reduced to:\n",
    "-------------------------------------------------------\n",
    "    4\n",
    "\n")

target_v1 <- unlist(target_v1)




# `````````````````````````````````````````` #
#  Construct targets for some special cases  #
# .......................................... #

target_bord_none <- c(bord = paste0(
    "The bordering regions were specified as \"none\"\n",
    "----------------------------------------------\n",
    "    * no fraction names to show *\n",
    "\n"))

target_bord_1val <- c(bord = paste0(
    "The bordering regions were specified as each having length 0:\n",
    "-------------------------------------------------------------\n",
    "    * no fraction names to show *\n",
    "\n"))

target_bord_2val <- c(bord = paste0(
    "The bordering regions were specified as having lengths 1 and 99:\n",
    "----------------------------------------------------------------\n",
    "    frac2\n",
    "    frac5\n",
    "    frac6\n",
    "\n"))

target_nfinal_none <- c(ffin = paste0(
    "The total number of candidate compounds was reduced to:\n",
    "-------------------------------------------------------\n",
    "    0\n",
    "\n"))




# ``````````````````````` #
#  Save data for testing  #
# ....................... #

save(out_v1, out_bord_none, out_bord_1val, out_bord_2val, out_nfinal_none,
     target_v1, target_bord_none, target_bord_1val, target_bord_2val, target_nfinal_none,
     file="tests/data/data-summary-filterMS.RData")
