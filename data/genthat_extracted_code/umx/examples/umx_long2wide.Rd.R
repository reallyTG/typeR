library(umx)


### Name: umx_long2wide
### Title: Take a long twin-data file and make it wide (one family per row)
### Aliases: umx_long2wide

### ** Examples

# ================================================================
# = First we have to make a long format file to base the demo on =
# ================================================================
tmp = twinData[, -2]
tmp$twinID1 = 1
tmp$twinID2 = 2
long = umx_wide2long(data = tmp, sep = "")
#

# OK. Now to demo long2wide...

# Keeping all columns
wide = umx_long2wide(data= long, famID= "fam", twinID= "twinID", zygosity= "zygosity")
names(wide) # some vars, like part, should have been passed along instead of made into "part_T1"

# Just keep bmi and wt
wide = umx_long2wide(data= long, famID= "fam", twinID= "twinID", 
    zygosity= "zygosity", vars2keep = c("bmi", "wt"))
names(wide)

# "fam" "twinID" "zygosity" "bmi_T1" "wt_T1" "bmi_T2" "wt_T2"

# Keep bmi and wt, and pass through 'cohort'
wide = umx_long2wide(data= long, famID= "fam", twinID= "twinID", zygosity= "zygosity", 
  vars2keep = c("bmi", "wt"), passalong = "cohort")



