library(aqp)


### Name: subsetProfiles-methods
### Title: Subset SoilProfileCollection Objects.
### Aliases: subsetProfiles subsetProfiles,SoilProfileCollection-method
### Keywords: methods manip

### ** Examples

data(sp1)
depths(sp1) <- id ~ top + bottom
site(sp1) <- ~ group

# save par settings, and setup plot for 3 columns
op <- par(mar=c(1,1,8,1), mfcol=c(1,3))

# subset sp1 via site-level attributes
# note quoting style
plot(group.1 <- subsetProfiles(sp1, s="group == '1'"))

# subset sp1 via horizon-level attributes
# note quoting style
plot(coarse.soils <- subsetProfiles(sp1, h="texture == 'LS'"))

# re-combine subsets, note that duplicates are removed
g <- rbind(group.1, coarse.soils)
plot(g)

# reset plot area
par(op)


# subset sp1 via horizon and site-level attributes
plot(tiny.set <- subsetProfiles(sp1, s="group == 2", h='prop < 8'))


## other ways to subset SoilProfileCollection objects, via index
# more interesting sample data
data(sp2)
depths(sp2) <- id ~ top + bottom
site(sp2) <- ~ surface

# subset by integer index, note that this does not re-order the profiles
plot(sp2[1:5, ])

# generate an integer index via pattern-matching
idx <- grep('modesto', sp2$surface, ignore.case=TRUE)
plot(sp2[idx, ])

# generate in index via profileApply:
# subset those profiles where: min(ph) < 5.6
idx <- which(profileApply(sp2, function(i) min(i$field_ph, na.rm=TRUE) < 5.6))
plot(sp2[idx, ])



