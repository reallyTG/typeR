library(icd)


### Name: simplify_map_lex
### Title: Internal function to simplify a comorbidity map by only
###   including codes which are parents, or identical to, a given list of
###   codes.
### Aliases: simplify_map_lex
### Keywords: internal

### ** Examples

# one exact match, next cmb parent code, next cmb child code
icd10 <- as.icd10(c("I0981", "A520", "I26019"))
pts <- data.frame(visit_id = c("a", "b", "c"), icd10)
simple_map <- icd:::simplify_map_lex(icd10, icd10_map_ahrq)
stopifnot(simple_map$CHF == "I0981")
stopifnot(simple_map$PHTN != character(0))
stopifnot(simple_map$PVD == "I26019")
umap <- icd:::simplify_map_lex(uranium_pathology$icd10, icd10_map_ahrq)
head(icd:::categorize_simple(uranium_pathology, icd10_map_ahrq,
                      id_name = "case", code_name = "icd10"))
head(icd:::categorize_simple(uranium_pathology, umap,
                             id_name = "case", code_name = "icd10"))



