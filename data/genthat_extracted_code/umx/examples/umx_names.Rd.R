library(umx)


### Name: umx_names
### Title: umx_names
### Aliases: umx_names namez

### ** Examples

# Names from a dataframe, with character matching
umx_names(mtcars, "mpg") # only "mpg" matches this

# Easy-to-type alias "namez"
namez(mtcars, "mpg")

# Use a regular expression to match a pattern
namez(mtcars, "r[ab]") # "drat", "carb"
namez(mtcars, "^d") # vars beginning with 'd' = "disp", drat

# Use this function to replace text in names!
umx_names(mtcars, "mpg", replacement = "hello") # "mpg" replaced with "hello"


# ========================================================================
# = Using the custom collapse option to quote each item, and wrap in c() =
# ========================================================================
namez(mtcars, "m", collapse = "as.vector") # Paste-able R-code for a vector

# Other options passed to R's grep command
umx_names(mtcars, "mpg" , invert = TRUE)  # Non-matches (instead of matches)
umx_names(mtcars, "disp", value  = FALSE) # Return indices of matches 
umx_names(mtcars, "^d"  , fixed  = TRUE)  # Vars containing literal '^d' (none...)

# =======================================
# = Examples using built-in GFF dataset =
# =======================================

# Just show phenotypes for Twin 1
umx_names(GFF, "T_1$") # twin 1
# "zyg" "sex1" "age_T1" "gff_T1" "fc_T1" "qol_T1" "hap_T1"...

umx_names(GFF, "2$") # names ending in 2
umx_names(GFF, "[^12bs]$") # doesn't end in `1`, `2`, `b`, or `s`
# "zyg_6grp" "zyg_2grp" "divorce"
umx_names(mxData(twinData[, c("wt1", "wt2")], type= "raw"))
umx_names(mxData(cov(twinData[, c("wt1", "wt2")], use="comp"), type= "cov", numObs= 1000))
umx_names(mxDataWLS(na.omit(twinData[, c("wt1", "wt2")]), type= "WLS"))



