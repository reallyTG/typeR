library(qdap)


### Name: word_stats
### Title: Descriptive Word Statistics
### Aliases: word_stats
### Keywords: descriptive statistic

### ** Examples

## Not run: 
##D word_stats(mraja1spl$dialogue, mraja1spl$person)
##D 
##D (desc_wrds <- with(mraja1spl, word_stats(dialogue, person, tot = tot)))
##D 
##D ## Recycle for speed boost
##D with(mraja1spl, word_stats(desc_wrds, person, tot = tot)) 
##D 
##D scores(desc_wrds)
##D counts(desc_wrds)
##D htruncdf(counts(desc_wrds), 15, 6)
##D plot(scores(desc_wrds))
##D plot(counts(desc_wrds))
##D 
##D names(desc_wrds)
##D htruncdf(desc_wrds$ts, 15, 5)
##D htruncdf(desc_wrds$gts, 15, 6)
##D desc_wrds$mpun 
##D desc_wrds$word.elem
##D desc_wrds$sent.elem 
##D plot(desc_wrds)
##D plot(desc_wrds, label=TRUE, lab.digits = 1)
##D 
##D ## Correlation Visualization
##D qheat(cor(scores(desc_wrds)[, -1]), diag.na = TRUE, by.column =NULL,
##D     low = "yellow", high = "red", grid = FALSE)
##D 
##D ## Parallel (possible speed boost)
##D with(mraja1spl, word_stats(dialogue, list(sex, died, fam.aff))) 
##D with(mraja1spl, word_stats(dialogue, list(sex, died, fam.aff), 
##D     parallel = TRUE)) 
##D     
##D ## Recycle for speed boost
##D word_stats(desc_wrds, mraja1spl$sex)
## End(Not run)



