library(qdap)


### Name: outlier_detect
### Title: Detect Outliers in Text
### Aliases: outlier_detect

### ** Examples

## Not run: 
##D with(DATA, outlier_detect(state))
##D with(DATA, outlier_detect(state, FUN = character_count))
##D with(DATA, outlier_detect(state, person, FUN = character_count))
##D with(DATA, outlier_detect(state, list(sex, adult), FUN = character_count))
##D with(DATA, outlier_detect(state, FUN = syllable_sum))
##D htruncdf(with(raj, outlier_detect(dialogue, person)), 15, 45)
## End(Not run)   



