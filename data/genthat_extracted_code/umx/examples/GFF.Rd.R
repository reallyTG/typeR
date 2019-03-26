library(umx)


### Name: GFF
### Title: Twin data: General Family Functioning, divorce, and wellbeing.
### Aliases: GFF
### Keywords: datasets

### ** Examples

# Twin 1 variables (end in '_T1')
data(GFF)
umx_names(GFF, "1$") # Just variables ending in 1 (twin 1)
str(GFF) # first few rows

m1 = umxACE(selDVs= "gff", sep = "_T",
	mzData = subset(GFF, zyg_2grp == "MZ"), 
	dzData = subset(GFF, zyg_2grp == "DZ")
)




