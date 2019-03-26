
# ``````````````````` #
#  Load testing data  #
# ................... #

# Construct ms and bioactivity data
load("../data/data-rankEN-test.RData")

# Construct rankEN objects
out_rankEN_v1 <- rankEN(filterMS_obj, bioact, reg_idx, reg_idx, lambda)
out_rankEN_v2 <- rankEN(filterMS_obj, bioact, reg_idx, reg_idx, lambda, TRUE, 6)
out_rankEN_v2$summ_info$region_nm$ms[1:5 * 2L] <- c("asdf", "987321.555444333", "*", "<.>", "42")
out_rankEN_v2$summ_info$cmp_rm <- NULL

# Obtain summary output in string form
out_v1 <- format(out_rankEN_v1, 5L)
out_v2 <- format(out_rankEN_v2, 999)




# ````````````````````````````````````` #
#  Construct target results for out_v1  #
# ..................................... #

target_v1 <- list()

target_v1$newl <- "\n"

target_v1$ddim <- paste0(
    "Data dimensions (some compounds were removed):\n",
    "----------------------------------------------\n",
    "    region of interest:       10\n",
    "    candidate compounds:     204\n",
    "    bioactivity replicates:    4\n",
    "\n")

target_v1$crem <- paste0(
    "Compounds removed for being constant:\n",
    "-------------------------------------\n",
    "    Mass-to-charge    Charge\n",
    "    --------------    ------\n",
    "    501               701   \n",
    "    502               702   \n",
    "    503               703   \n",
    "    504               704   \n",
    "\n")

target_v1$regi <- paste0(
    "Fractions included in region of interest:\n",
    "-----------------------------------------\n",
    "    Mass spec.    Bioactivity\n",
    "    ----------    -----------\n",
    "    ms21          bio21      \n",
    "    ms22          bio22      \n",
    "    ms23          bio23      \n",
    "    ms24          bio24      \n",
    "    ms25          bio25      \n",
    "    ms26          bio26      \n",
    "    ms27          bio27      \n",
    "    ms28          bio28      \n",
    "    ms29          bio29      \n",
    "    ms30          bio30      \n",
    "\n")

target_v1$args <- paste0(
    "Parameter arguments provided to rankEN:\n",
    "---------------------------------------\n",
    "    Quadratic penalty parameter:          0.1\n",
    "    Consider only positive correlations:  yes\n",
    "    Max number of candidate compounds:    all\n",
    "\n")

target_v1$rank <- paste0(
    "Compounds in order of entrance (first 5 compounds, earliest at top):\n",
    "--------------------------------------------------------------------\n",
    "    Mass spec.    Charge    Correlation\n",
    "    ----------    ------    -----------\n",
    "     16           1         0.7847     \n",
    "      2           1         0.7395     \n",
    "      1           1         0.7474     \n",
    "    186           1         0.6479     \n",
    "     80           1         0.6866     \n",
    "\n")

target_v1 <- unlist(target_v1)




# `````````````````````````````` #
#  Construct targets for out_v2  #
# .............................. #

target_v2 <- list()

target_v2$newl <- "\n"

target_v2$ddim <- paste0(
    "Data dimensions:\n",
    "----------------\n",
    "    region of interest:       10\n",
    "    candidate compounds:     200\n",
    "    bioactivity replicates:    4\n",
    "\n")

target_v2$rem <- ""

target_v2$regi <- paste0(
    "Fractions included in region of interest:\n",
    "-----------------------------------------\n",
    "    Mass spec.          Bioactivity\n",
    "    ----------          -----------\n",
    "    ms21                bio21      \n",
    "    asdf                bio22      \n",
    "    ms23                bio23      \n",
    "    987321.555444333    bio24      \n",
    "    ms25                bio25      \n",
    "    *                   bio26      \n",
    "    ms27                bio27      \n",
    "    <.>                 bio28      \n",
    "    ms29                bio29      \n",
    "    42                  bio30      \n",
    "\n")

target_v2$args <- paste0(
    "Parameter arguments provided to rankEN:\n",
    "---------------------------------------\n",
    "    Quadratic penalty parameter:          0.1\n",
    "    Consider only positive correlations:  yes\n",
    "    Max number of candidate compounds:    6\n",
    "\n")

target_v2$rank <- paste0(
    "Compounds in order of entrance (all compounds, earliest at top):\n",
    "----------------------------------------------------------------\n",
    "    Mass spec.    Charge    Correlation\n",
    "    ----------    ------    -----------\n",
    "     16           1         0.7847     \n",
    "      2           1         0.7395     \n",
    "      1           1         0.7474     \n",
    "    186           1         0.6479     \n",
    "     80           1         0.6866     \n",
    "     41           1         0.5002     \n",
    "\n")

target_v2 <- unlist(target_v2)




# ``````````````````````` #
#  Save data for testing  #
# ....................... #

save(out_v1, out_v2, target_v1, target_v2,
     file="../data/data-summary-rankEN.RData")


