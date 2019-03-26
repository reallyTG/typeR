library(radiant.multivariate)


### Name: the_table
### Title: Function to calculate the PW and IW table for conjoint
### Aliases: the_table

### ** Examples

result <- conjoint(mp3, rvar = "Rating", evar = "Memory:Shape")
the_table(tidy(result$model_list[[1]][["model"]]), result$dataset, result$evar)




