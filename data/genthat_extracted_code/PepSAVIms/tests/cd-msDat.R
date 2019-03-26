
# Create data used for testing with test-rankEN.R


# Create 'raw' mass spec data --------------------------------------------------

# This is the raw data in several forms, which is to be coerced into class
# msDat.  Columns 1 and 2 of ms_mat are the mass-to-charge ratio and charge
# values, respectively.

ms_mat <- matrix(1:40,
                nrow=5,
                dimnames=list(paste0(1:5),
                              c("mtoz",
                                "chg",
                                paste0("ms", 1:3),
                                paste0("junk", 1:3))))
# Data indices
mtoz_idx <- 1L
chg_idx <- 2L
inten_idx <- 3:5

# Data col names
mtoz_nm <- "mtoz"
chg_nm <- "chg"
inten_nm <- paste0("ms", 1:3)

# Data vectors
mtoz_data <- ms_mat[, 1L]
chg_data <- ms_mat[, 2L]

# Add an NA to the superfluous data in ms_mat (should not matter)
ms_mat[1L, "junk1"] <- NA

# Create a data frame object for the mass spec data
ms_df <- data.frame(ms_mat)
# Turn one of the columns into character data
ms_df$junk3 <- "abc"

# Data restricted to non-superfluous data
ms_red <- ms_mat[, c(mtoz_idx, chg_idx, inten_idx)]
ms_red_df <- data.frame(ms_red)



# Manually construct 'true' msDat object ---------------------------------------

ms_nm <- list(paste0(format(round(mtoz_data, 4), nsmall=4), "/", chg_data),
              c("ms1", "ms2", "ms3"))
ms_true <- matrix(11:25,
                  nrow=5,
                  dimnames=ms_nm)

trueDat <- structure(list(ms   = ms_true,
                          mtoz = setNames(1:5, paste(1:5)),
                          chg  = setNames(6:10, paste(1:5))),
                     class="msDat")

true_one_col <- structure(list(ms   = ms_true[, "ms1", drop=FALSE],
                               mtoz = setNames(1:5, paste(1:5)),
                               chg  = setNames(6:10, paste(1:5))),
                          class="msDat" )


# Save data to file for use by testing script ----------------------------------

save(ms_mat,
     mtoz_idx,
     chg_idx,
     inten_idx,
     mtoz_nm,
     chg_nm,
     inten_nm,
     mtoz_data,
     chg_data,
     ms_mat,
     ms_df,
     ms_red,
     ms_red_df,
     trueDat,
     true_one_col,
     file="tests/data/data-msDat.RData")
     
