library(AHMbook)


### Name: SwissTits
### Title: Data from the Swiss Breeding Bird Survey for 6 species of tits
### Aliases: SwissTits
### Keywords: datasets

### ** Examples

data(SwissTits)
str(SwissTits)

# Section 6.9.1, foot of p.257 and top of p.258:
# -------------
y0 <- SwissTits$counts[, , '2013', 'Great tit']
( NA.sites <- which(rowSums(is.na(y0)) == 3) ) # Unsurveyed sites
y <- y0[-NA.sites, ]                 # Drop them from the count data
tits <- SwissTits$sites[-NA.sites, ] # Also drop from the site covariates
str(y)
# Get date and duration data for 2013, without the NA.sites rows:
date <- SwissTits$date[-NA.sites, , '2013']
dur <- SwissTits$dur[-NA.sites, , '2013']

# Section 6.13.1, p.303
# --------------
# Get the count data for 2013 (all species)
y0 <- SwissTits$count[, , '2013', ]
str(y0)
# We keep the sites with count data, remove those with 3 NAs
# See which sites have counts in 2013 for (say) Great tits:
keep <- which(rowSums(is.na(y0[, , "Great tit"])) != 3)
length(keep)
y <- y0[keep, , ]
# Get the covariate data for the 'keep' sites
elev <- SwissTits$sites$ele[keep]
route <- SwissTits$sites$rlength[keep]
forest <- SwissTits$sites$forest[keep]
date <- SwissTits$date[keep, , '2013']  # Survey date
dur <- SwissTits$dur[keep, , '2013']    # Survey duration

# Degrade counts to detection/nondetection data
y3DRN <- y
y3DRN[y3DRN > 1] <- 1
str(y3DRN)
# Final detail...
( spec.names <- paste0(SwissTits$species$name, "s") )



