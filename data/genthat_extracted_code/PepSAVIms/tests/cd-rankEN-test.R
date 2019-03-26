
# `````````````````````````````````` #
#  Load a saved dataset for testing  #
# .................................. #

# Load saved simulated data (with working directory as tests/testthat).  See
# object sim_args in the RData file for the arguments used to generate the data.
# load("tests/data/data-rankEN-sim.RData")
load(file.path("..", "data", "data-rankEN-sim.RData"))

# msDatObj: a (200 x 50) mass spec data object
msDatObj <- testDat$msDatObj

# bioact: a (4 x 50) bioactivity object
bioact <- testDat$bioact

# reg_idx: the indices corresponding to the region of interest used in
# simulation
reg_idx <- sim_args$regIdx

# Indices that we will be introducting constant compounds for
const_idx <- 41L * 1:4

# Arbitrary numbers chosen for m/z and charge constant compounds
const_mtoz <- 501:504
const_chg <- 701:704




# ``````````````````````` #
#  Fit elastic net model  #
# ....................... #

# Explanetory data
ms_regr <- t( msDatObj$ms[, reg_idx] )

# Outcome values
bio_regr <- colMeans(bioact[, reg_idx])

# Arbitrary choice of lambda (quadratic penalty parameter)
lambda <- 0.1

# Fit model
enet_fit <- elasticnet::enet(x=ms_regr, y=bio_regr, lambda=lambda)




# ```````````````````````````````` #
#  Obtain compound entrance lists  #
# ................................ #

# Obtain action index.  This is a vector of the compound indices as they enter /
# leave the model; a positive value means it entered, and a negative value means
# it exited.
actions <- unlist(enet_fit$actions)
# Last action number is spurious (it gives the number of total fractions)
actions <- actions[-length(actions)]

# Obtain correlation values of proposed compounds
comp_cor <- apply(ms_regr, 2, function(x) cor(x, bio_regr))

# Indices in the order that the compounds first entered the model
enter_idx <- unique( actions[actions > 0] )
# Indices restricted to compounds positively correlated with bioactivity
pos_idx <- enter_idx[comp_cor[enter_idx] > 0]
# First 10 indices to enter the model
allcomp_10_idx <- enter_idx[ 1:min(length(pos_idx), 10L) ]
# First 10 indices to enter the model
pos_10_idx <- pos_idx[ 1:min(length(pos_idx), 10L) ]

# Indices in the order that the compounds first entered the model for various
# specifications of pos_only and ncomp
cmpidx <- list(all    = enter_idx,
               pos    = pos_idx,
               all_10 = allcomp_10_idx,
               pos_10 = pos_10_idx)




# `````````````````````````````` #
#  Create 'true' rankEN objects  #
# .............................. #

# Hand-computes four 'true' objects; each is a particular combination of
# pos_only and ncomp specifications

# Dimensions of the data used for analysis
data_dim  = list(reg  = nrow(ms_regr),
                 comp = ncol(ms_regr) + length(const_idx),
                 repl = nrow(bioact))

# Column names for region of interest
region_nm <- list(ms  = colnames(msDatObj$ms)[reg_idx],
                  bio = colnames(bioact)[reg_idx])

# Create summ_info objects for each combination of pos_only and ncomp
generate_summ_info <- function(pos_only, ncomp) {
    list(
        data_dim  = data_dim,
        region_nm = region_nm,
        lambda    = 0.1,
        pos_only  = pos_only,
        ncomp     = ncomp,
        cmp_rm    = list(mtoz = const_mtoz,
                         chg  = const_chg)
    )
}
summ_info <- list(
    all    = generate_summ_info(FALSE, NULL),
    pos    = generate_summ_info(TRUE,  NULL),
    all_10 = generate_summ_info(FALSE, 10L),
    pos_10 = generate_summ_info(TRUE,  10L)
)

# Construct rankEN objects for each combination of pos_only and ncomp
true_rankEN <- mapply(cmpidx, summ_info, SIMPLIFY=FALSE, FUN=function(idx, info) {
    list(mtoz      = msDatObj$mtoz[idx],
         charge    = msDatObj$chg[idx],
         comp_cor  = comp_cor[idx],
         enet_fit  = enet_fit,
         summ_info = info)
})
# Provide names for list elements
names(true_rankEN) <- names(cmpidx)
# Equip objects with rankEN class attribute
true_rankEN <- lapply(true_rankEN, structure, class="rankEN")





# `````````````````````````````````` #
#  Add constant rows to the ms data  #
# .................................. #

# Add some constant rows to the data.  These are supposed to be taken out prior
# to fitting the elastic net model so it should not change the result.

# Calculate dimensions and indices for adding 4 constant rows to the data
n_new_rows <- nrow(msDatObj) + length(const_idx)
replace_idx <- setdiff(1:204, const_idx)

# Create new data containers
ms_vals <- matrix(0, nrow=n_new_rows, ncol=ncol(msDatObj))
mtoz_vals <- replace(rep(0L, n_new_rows), const_idx, const_mtoz)
chg_vals <- replace(rep(0L, n_new_rows), const_idx, const_chg)

# Fill the data
ms_vals[replace_idx, ] <- msDatObj$ms
mtoz_vals[replace_idx] <- msDatObj$mtoz
chg_vals[replace_idx] <- msDatObj$chg


# Create msDat object
msDatObj_const <- msDat(ms_vals, mtoz_vals, chg_vals)
dimnames(msDatObj_const) <- list(replace(rep("asdf", n_new_rows),
                                         replace_idx,
                                         row.names(msDatObj)),
                                 colnames(msDatObj))
msDatObj <- msDatObj_const



# `````````````````````````````````````` #
#  Create related objects for testing    #
# ...................................... #

# Create a filterMS object from the available msDat object.  We don't need
# realistic values for cmp_by_crit and summ_info since rankEN extracts the msDat
# object from a filterMS object anyway.
filterMS_obj <- list(msDatObj    = msDatObj,
                     cmp_by_crit = NULL,
                     summ_info   = NULL)
class(filterMS_obj) <- c("filterMS", "msDat")

# Bioactivity data as a data.frame.  Note that we have created of column of type
# character.  This should be okay as the column is not part of the region of
# interest.
bio_df <- data.frame(bioact)
bio_df[, "bio1"] <- "asdf"

# Bioactivity data with missing in region of interest
bio_NA <- bioact
bio_NA[1L, reg_idx[1L]] <- NA_real_

# Bioactivity as a vector
bio_vec <- colMeans(bioact)
# Bioactivity as a 1-row matrix
bio_matr_ave <- matrix(bio_vec,
                       nrow=1L,
                       dimnames=list(NULL, colnames(bioact)))

# Mass spec and bioactivity data after reducing data to only the columns
# corresponding to the region of interest
ms_reg_only <- msDatObj[, reg_idx]
bio_reg_only <- bioact[, reg_idx]
bio_vec_reg_only <- bio_vec[reg_idx]

# Create a 'true' value for the case when bioactivity data is provided as
# 1-replicate or averaged data.  This just requires modifying the summ_info from
# the previous case.
true_rankEN_bio_ave <- true_rankEN$pos
true_rankEN_bio_ave$summ_info$data_dim$repl <- 1L




# ````````````````````````````````````` #
#  Remove objects from workspace not used by testing script  #
# ..................................... #

keep_nm <- c(
    # Objects used in rankEN calls
    "msDatObj",
    "bioact",
    "reg_idx",
    "lambda",
    # 'True' objects to test against
    "true_rankEN",
    "true_rankEN_bio_ave",
    # Derived objects for further testing
    "filterMS_obj",
    "bio_df",
    "bio_NA",
    "bio_vec",
    "bio_matr_ave",
    "ms_reg_only",
    "bio_reg_only",
    "bio_vec_reg_only")

rm(list = setdiff(ls(), keep_nm))

