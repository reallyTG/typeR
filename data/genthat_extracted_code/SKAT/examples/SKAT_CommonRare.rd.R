library(SKAT)


### Name: SKAT_CommonRare
### Title: SKAT for the combined effect of common and rare variants
### Aliases: SKAT_CommonRare SKAT_CommonRare.SSD.OneSet
###   SKAT_CommonRare.SSD.OneSet_SetIndex SKAT_CommonRare.SSD.All

### ** Examples



data(SKAT.example)
attach(SKAT.example)



# continuous trait
obj<-SKAT_Null_Model(y.c ~ X, out_type="C")
SKAT_CommonRare(Z, obj)$p.value
SKAT_CommonRare(Z, obj, method="A")$p.value
SKAT_CommonRare(Z, obj, method="AR")$p.value


# dichotomous trait 
obj<-SKAT_Null_Model(y.b ~ X, out_type="D")

# Combined sum test in the manuscript (SKAT-C and Burden-C)
SKAT_CommonRare(Z, obj)$p.value
SKAT_CommonRare(Z, obj, r.corr.rare=1, r.corr.common=1 )$p.value


# Test only with common variant
SKAT_CommonRare(Z, obj, test.type="Common.Only")$p.value

# Test only with rare variant
SKAT_CommonRare(Z, obj, test.type="Rare.Only")$p.value


# Use CommonRare_Cutoff=0.01 instead of CommonRare_Cutoff = NULL
SKAT_CommonRare(Z, obj, CommonRare_Cutoff=0.01)$p.value






