## ---- include=FALSE------------------------------------------------------
library("icd")

## ----setup---------------------------------------------------------------
Elix_comor <- names(icd9_map_ahrq)
AHRQ_comor <- names(icd9_map_elix)

## ----shared--------------------------------------------------------------
intersect(AHRQ_comor, Elix_comor)

## ----in_ahrq-------------------------------------------------------------
setdiff(AHRQ_comor, Elix_comor)

## ----in_elix-------------------------------------------------------------
setdiff(Elix_comor, AHRQ_comor)

## ----comparison----------------------------------------------------------
comp <- diff_comorbid(icd9_map_ahrq, icd9_map_elix, 
                      show = TRUE, explain = TRUE)

## ----justCHF-------------------------------------------------------------
comp$CHF

