
# Create a small dataset of mass spec intensity values, m/z values, and charge
# states.  The mass spec intensity data has dimension (24 x 6).  Also
# hand-construct a filtered 'true' data set which is used to compare the results
# from the filtering function against.
#
# Hand-construct filtered data sets for some variations of the canonical
# (original data set), such as: size zero border, size 1 left 1 right border,
# size 1 left 0 right border, size 2 left 2 right border, and a dataset where no
# observations satisfied all of the criteria.
#
# Create some objects with filterMS() using various inputs to be checked later
# in testing.


#``````````````````````````````````````````````````` #
#  Specify params determining the filtering process  #
# .................................................. #

region <- paste0("frac", 3:4)
border <- "all"
bord_ratio <- 0.05
min_inten <- 1000
max_chg <- 7L




# ``````````````````````` #
#  Create mass spec data  #
# ....................... #

# The data is constructed by constructing 6 blocks of data, each with 4
# observations.  A 'good' data block is created, in that it satisfies the
# filtering criteria specified above.  Then several 'bad' blocks are created by
# taking the good block and changing some of the elements so that not all of the
# of the criteria are satisfied.
#
# There are 5 bad blocks; each bad block's observations fail a particular
# criterion (some will fail more than 1)

good_ms <- matrix(c(   25,   50, 1500, 1750,   50,   25,
                       85,   65, 2000, 2000,   20,    0,
                       40,   45, 1001, 1099,    5,    0,
                      100,    0, 2555, 2200,    0,   90 ),
                  nrow=4L,
                  byrow=TRUE)

# Create initial 'bad' objects by copying the good one; these will have their
# elements modified in what follows
bad_1 <- bad_2 <- bad_3 <- bad_4 <- bad_5 <- good_ms

# block fails: maximum outside of region
bad_1[, 1L] <- 3000

# block fails: bordering region has values with ratio greater than bord_ratio in
# comparison to the maximum value
bad_2[, 2L] <- 500

# block fails: the fraction next to the maximum value must be nonzero
bad_3 <- apply(good_ms, 1, function(x) {
  maxIdx <- tail(which(x == max(x)), 1L)
  replace(x, maxIdx + 1L, 0)
})
bad_3 <- t(bad_3)

# block fails: each fraction in region must have value greater than min_inten
bad_4[, 3:4] <- 999

# note: charge value will be chosen which will cause bad_5 to fail (these
# haven't yet been constructed), so no changes need to be made to this block

# Create ms data by stacking the observations
ms <- rbind(good_ms, bad_1, bad_2, bad_3, bad_4, bad_5)
colnames(ms) <- paste0("frac", 1:6)

# Create mass-to-charge and charge values
mtoz_vals <- seq_len( nrow(ms) )
chg_vals <- rep(3:8, each=nrow(good_ms))

# Create msDatObj from test data
msDatObj <- msDat(ms, mtoz_vals, chg_vals)





# ``````````````````````````````` #
#  Create 'true' filterMS object  #
# ............................... #

# Indices corresponding to the observations that satisfy the each criterion,
# taken one-at-a-time.  The indices are created by visually inspecting the data.
keep_cmp_idx <- list(
  c1 = setdiff(1:24, 5:8),
  c2 = setdiff(1:24, c(5:12, c(17, 18, 20))),
  c3 = setdiff(1:24, c(8, 13:16, 20)),
  c4 = setdiff(1:24, 17:20),
  c5 = setdiff(1:24, 21:24)
)

# Create the cmp_by_crit element in a filterMS object, i.e a list such that each
# element is a data.frame with each row the m/z and charge for a compound that
# satisfied the particular criterion
true_cmp_by_cr <- lapply(keep_cmp_idx, function(j)
  data.frame(mtoz=mtoz_vals[j], chg=chg_vals[j])
)

# Create the msDat element in a filterMS object.  Only the first 4 observations
# satisfy all of the filtering criteria.
true_msDatObj <- msDat(ms[1:4, ], mtoz_vals[1:4], chg_vals[1:4])

# Create the summ_info element in a filterMS object
true_summ_info <- list(
  orig_dim   = c(24L, 6L),
  reg_nm     = region,
  bor_nm     = paste0("frac", c(1:2, 5:6)),
  border     = border,
  bord_ratio = bord_ratio,
  min_inten  = min_inten,
  max_chg    = max_chg
)

# Create filterMS object
true_filterMS <- list( msDatObj  = true_msDatObj,
                       cmp_by_cr = true_cmp_by_cr,
                       summ_info = true_summ_info )
class(true_filterMS) <- c("filterMS", "msDat")




# ```````````````````````````````````` #
#  Create zero border filterMS object  #
# .................................... #

# Everything the same as the canonical set but now specify border as "none"

# Indices corresponding to the observations that satisfy the each criterion,
# taken one-at-a-time.  The indices are created by visually inspecting the data.
keep_zero_border_cmp_idx <- list(
  c1 = setdiff(1:24, integer(0L)),
  c2 = setdiff(1:24, integer(0L)),
  c3 = setdiff(1:24, 16L),
  c4 = setdiff(1:24, 17:20),
  c5 = setdiff(1:24, 21:24)
)

# Create the cmp_by_crit element in a filterMS object, i.e a list such that each
# element is a data.frame with each row the m/z and charge for a compound that
# satisfied the particular criterion
true_zero_border_cmp_by_cr <- lapply(keep_zero_border_cmp_idx, function(j)
  data.frame(mtoz=mtoz_vals[j], chg=chg_vals[j])
)

# Create the msDat element in a filterMS object.  Index created by visual
# inspection of the data.
zero_border_keep_idx <- 1:15
true_zero_border_msDatObj <- msDat(ms[zero_border_keep_idx, ],
                                   mtoz_vals[zero_border_keep_idx],
                                   chg_vals[zero_border_keep_idx])

# Create the summ_info element in a filterMS object
true_zero_border_summ_info <- list(
  orig_dim   = c(24L, 6L),
  reg_nm     = region,
  bor_nm     = character(0L),
  border     = "none",
  bord_ratio = bord_ratio,
  min_inten  = min_inten,
  max_chg    = max_chg
)

# Create filterMS object
true_zero_border <- list(msDatObj  = true_zero_border_msDatObj,
                         cmp_by_cr = true_zero_border_cmp_by_cr,
                         summ_info = true_zero_border_summ_info )
class(true_zero_border) <- c("filterMS", "msDat")




# ``````````````````````````````````````````` #
#  Create filterMS object with size 1 border  #
# ........................................... #

# Everything the same as the canonical set but now specify border as 1

# Indices corresponding to the observations that satisfy the each criterion,
# taken one-at-a-time.  The indices are created by visually inspecting the data.
keep_one_border_idx <- list(
  c1 = setdiff(1:24, integer(0)),
  c2 = setdiff(1:24, c(9:12, 17, 18)),
  c3 = setdiff(1:24, c(13:16, 20)),
  c4 = setdiff(1:24, 17:20),
  c5 = setdiff(1:24, 21:24)
)

# Create the cmp_by_crit element in a filterMS object, i.e a list such that each
# element is a data.frame with each row the m/z and charge for a compound that
# satisfied the particular criterion
true_one_border_cmp_by_cr <- lapply(keep_one_border_idx, function(j)
  data.frame(mtoz=mtoz_vals[j], chg=chg_vals[j])
)

# Create the msDat element in a filterMS object.  Only the first 4 observations
# satisfy all of the filtering criteria.
one_border_keep_idx <- 1:8
true_one_border_msDatObj <- msDat(ms[one_border_keep_idx, ],
                                  mtoz_vals[one_border_keep_idx],
                                  chg_vals[one_border_keep_idx])

# Create the summ_info element in a filterMS object
true_one_border_summ_info <- list(
  orig_dim   = c(24L, 6L),
  reg_nm     = region,
  bor_nm     = paste0("frac", c(2, 5)),
  border     = 1L,
  bord_ratio = bord_ratio,
  min_inten  = min_inten,
  max_chg    = max_chg
)

# Create filterMS object
true_one_border <- list(msDatObj  = true_one_border_msDatObj,
                        cmp_by_cr = true_one_border_cmp_by_cr,
                        summ_info = true_one_border_summ_info)
class(true_one_border) <- c("filterMS", "msDat")




# ```````````````````````````````````````````````` #
#  Create filterMS object with size (1, 0) border  #
# ................................................ #

# Everything the same as the canonical set but now specify border as 1

# Indices corresponding to the observations that satisfy the each criterion,
# taken one-at-a-time.  The indices are created by visually inspecting the data.
keep_onezero_border_idx <- list(
  c1 = setdiff(1:24, integer(0)),
  c2 = setdiff(1:24, c(9:12, 17, 18)),
  c3 = setdiff(1:24, 16L),
  c4 = setdiff(1:24, 17:20),
  c5 = setdiff(1:24, 21:24)
)

# Create the cmp_by_crit element in a filterMS object, i.e a list such that each
# element is a data.frame with each row the m/z and charge for a compound that
# satisfied the particular criterion
true_onezero_border_cmp_by_cr <- lapply(keep_onezero_border_idx, function(j)
  data.frame(mtoz=mtoz_vals[j], chg=chg_vals[j])
)

# Create the msDat element in a filterMS object.  Only the first 4 observations
# satisfy all of the filtering criteria.
one_border_keep_idx <- c(1:8, 13:15)
true_onezero_border_msDatObj <- msDat(ms[one_border_keep_idx, ],
                                  mtoz_vals[one_border_keep_idx],
                                  chg_vals[one_border_keep_idx])

# Create the summ_info element in a filterMS object
true_onezero_border_summ_info <- list(
  orig_dim   = c(24L, 6L),
  reg_nm     = region,
  bor_nm     = "frac2",
  border     = c(1L, 0L),
  bord_ratio = bord_ratio,
  min_inten  = min_inten,
  max_chg    = max_chg
)

# Create filterMS object
true_onezero_border <- list(msDatObj  = true_onezero_border_msDatObj,
                            cmp_by_cr = true_onezero_border_cmp_by_cr,
                            summ_info = true_onezero_border_summ_info)
class(true_onezero_border) <- c("filterMS", "msDat")




# ````````````````````````````````````````````````````````````` #
#  Numeric value for border that spans all remaining fractions  #
# ............................................................. #

# Same result as canonical example, just need to change an entry in the summary
# information
true_border_num_all <- true_filterMS
true_border_num_all$summ_info$border <- 2L
                  



# ``````````````````````````````````````` #
#  No observations satisfy all criterion  #
# ....................................... #

# Create a dataset without any successful compounds by setting the max charge
# allowed to 0

# Criterion all the same as canonical example except for #5
nosatisfy_cmp_by_cr <- true_cmp_by_cr
nosatisfy_cmp_by_cr$c5 <- data.frame(mtoz = mtoz_vals[integer(0L)],
                                     chg  = chg_vals[integer(0L)] )

# Modify the summ_info
nosatisfy_summ_info <- true_summ_info
nosatisfy_summ_info$max_chg <- 0L

# Create testing object
true_nosatisfy <- list(msDatObj  = NULL,
                       cmp_by_cr = nosatisfy_cmp_by_cr,
                       summ_info = nosatisfy_summ_info)
class(true_nosatisfy) <- c("filterMS", "msDat")




# ````````````````````````````````````````````````` #
#  Object for testing region and border assignment  #
#.................................................. #

# Create a (3 x 12) msDat object
ms2 <- matrix(1:36, ncol=12)
ms2[, 5:6] <- 1500
colnames(ms2) <- paste0("ms", 1:12)
msDatObj_alt <- msDat(ms2, 1:3, rep(3L, 3))




# ````````````````````` #
#  Create binMS object  #
# ..................... #

# Note: no need to give real values for summ_info since it is discarded anyway
binMS_obj <- list(msDatObj  = msDatObj,
                  summ_info = NULL)
class(binMS_obj) <- c("binMS", "msDat")




# ````````````````````````````````````````````` #
#  Save data to file for use by testing script  #
# ............................................. #

save(true_filterMS,
     true_zero_border,
     true_one_border,
     true_onezero_border,
     true_border_num_all,
     true_nosatisfy,
     msDatObj,
     msDatObj_alt,
     binMS_obj,
     file="tests/data/data-filterMS.RData")
