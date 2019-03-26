library(eiCompare)


### Name: ei_est_gen
### Title: Iterative EI Estimation
### Aliases: ei_est_gen

### ** Examples

# TOY DATA EXAMPLE
canda <- c(.1, .09, .85, .9, .92)
candb <- 1-canda
white <- c(.8, .9, .10, .08, .11)
black <- 1 - white
total <- c(30,80, 70, 20, 29)
toy <- data.frame(canda, candb, white, black, total)

# CREATE VECTORS
cands <- c("canda")
race_group <- c("~ black") # only use one group for example
table_names <- c("EI: PCT Black", "EI: PCT White")

# RUN ei_est_gen()
# KEEP DATA TO JUST ONE ROW FOR EXAMPLE (time) ONLY!
ei_est_gen(cands, race_group, "total",
            data = toy[c(1,3,5),], table_names = table_names, sample=100)

## No test: 
# WARNING -- May take a little while to execute
# Load Package Data
data(corona)
# Create Character Vectors
cands <- c("pct_husted","pct_spiegel","pct_ruth","pct_button","pct_montanez","pct_fox")
race_group3 <- c("~ pct_hisp", "~ pct_asian", "~ pct_white")
table_names <- c("EI: Pct Hisp", "EI: Pct Asian", "EI: Pct White")

# Run ei_est_gen function
results <- ei_est_gen(cand_vector=cands, race_group = race_group3,
			total = "totvote", data = corona, table_names = table_names)

results
# Run ei_est_gen function; Exporting betas into data frame
results_w_betas <- ei_est_gen(cand_vector=cands, race_group = race_group3,
			total = "totvote", data = corona, table_names = table_names, beta_yes=T)

res1 <- results_w_betas[[1]]# table of mean estimates
res1
res2 <- results_w_betas[[2]]# betas of estimates for each precinct

## End(No test)



