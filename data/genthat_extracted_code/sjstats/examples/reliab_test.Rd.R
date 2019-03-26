library(sjstats)


### Name: reliab_test
### Title: Check internal consistency of a test or questionnaire
### Aliases: reliab_test split_half cronb difficulty mic

### ** Examples

library(sjlabelled)
# Data from the EUROFAMCARE sample dataset
data(efc)

# retrieve variable and value labels
varlabs <- get_label(efc)

# recveive first item of COPE-index scale
start <- which(colnames(efc) == "c82cop1")
# recveive last item of COPE-index scale
end <- which(colnames(efc) == "c90cop9")

# create data frame with COPE-index scale
x <- efc[, c(start:end)]
colnames(x) <- varlabs[c(start:end)]

# reliability tests
reliab_test(x)

# split-half-reliability
split_half(x)

# cronbach's alpha
cronb(x)

# mean inter-item-correlation
mic(x)

# item difficulty
difficulty(x)

## Not run: 
##D library(sjPlot)
##D sjt.df(reliab_test(x), describe = FALSE, show.cmmn.row = TRUE,
##D        string.cmmn = sprintf("Cronbach's &alpha;=%.2f", cronb(x)))
##D 
##D # Compute PCA on Cope-Index, and perform a
##D # reliability check on each extracted factor.
##D factors <- sjt.pca(x)$factor.index
##D findex <- sort(unique(factors))
##D library(sjPlot)
##D for (i in seq_len(length(findex))) {
##D  rel.df <- subset(x, select = which(factors == findex[i]))
##D  if (ncol(rel.df) >= 3) {
##D    sjt.df(reliab_test(rel.df), describe = FALSE, show.cmmn.row = TRUE,
##D           use.viewer = FALSE, title = "Item-Total-Statistic",
##D           string.cmmn = sprintf("Scale's overall Cronbach's &alpha;=%.2f",
##D                                 cronb(rel.df)))
##D    }
##D  }
## End(Not run)




