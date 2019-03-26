library(eiCompare)


### Name: goodman_generalize
### Title: Goodman Regression Generalization
### Aliases: goodman_generalize

### ** Examples

# Load corona data
data(corona)
# Generate character vectors
cands <- c("pct_husted","pct_spiegel","pct_ruth","pct_button","pct_montanez","pct_fox")
race_group3 <- c("~ pct_hisp", "~ pct_asian", "~ pct_white")

# Goodman Regression
table_names <- c("Good: Pct Lat", "Good: Pct Asian", "Good: Pct Wht")
good_corona <- goodman_generalize(cands, race_group3, "totvote", corona, table_names)



