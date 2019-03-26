library(eiCompare)


### Name: plot.ei_compare
### Title: Plot Method for class ei_compare
### Aliases: plot.ei_compare

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
results <- ei_est_gen(cands, race_group, "total",
                      data = toy[c(1,3,5),], table_names = table_names, sample=100)

# Generate formula for passage to ei.reg.bayes() function
form <- formula(cbind(canda,candb) ~ cbind(black, white)) 
# Run Bayesian model
suppressWarnings (
  ei_bayes <- ei.reg.bayes(form, data=toy, sample=100, truncate=TRUE)
)

table_names <- c("RxC: PCT Black", "RxC: PCT White")
cands <- c("canda", "candb")
ei_bayes_res <- bayes_table_make(ei_bayes, cand_vector= cands, table_names = table_names)
ei_bayes_res <- ei_bayes_res[c(1,2,5),]
# Combine Results, results in object of class ei_compare 
ei_rc_combine <- ei_rc_good_table(results, ei_bayes_res, 
                                  groups= c("Black", "White")
)
# Produces data and character vector, which can be sent to plot()
ei_rc_combine

# PLOT EI DIFFERENCES
plot(ei_rc_combine)

## No test: 
# Warning: Takes a while to run
# Load corona data
data(corona)
# Generate character vectors
cands <- c("pct_husted","pct_spiegel","pct_ruth","pct_button","pct_montanez","pct_fox")
race_group3 <- c("~ pct_hisp", "~ pct_asian", "~ pct_white")
table_names <- c("EI: Pct Lat", "EI: Pct Asian", "EI: Pct White")
# Run EI iterative Fitting
results <- ei_est_gen(cand_vector=cands, race_group = race_group3,
                      total = "totvote", data = corona, table_names = table_names)
# EI: RxC model 
# Generate formula
form <- formula(cbind(pct_husted,pct_spiegel,pct_ruth,pct_button,pct_montanez,pct_fox) 
~ cbind(pct_hisp, pct_asian, pct_white)) 
suppressWarnings (
  ei_bayes <- ei.reg.bayes(form, data=corona, sample=10000, truncate=TRUE)
)
# RxC table names
table_names <- c("RxC: Pct Hisp", "RxC: Pct Asian", "RxC: Pct White")
# Table Creation, using function bayes_table_make in ei_est_generalize.R file
ei_bayes_res <- bayes_table_make(ei_bayes, cand_vector= cands, table_names = table_names)

# Goodman Regression
table_names <- c("Good: Pct Lat", "Good: Pct Asian", "Good: Pct Wht")
good_corona <- goodman_generalize(cands, race_group3, "totvote", corona, table_names)

# Combine Results, results in object of class ei_compare 
ei_rc_g_combine <- ei_rc_good_table(results, ei_bayes_res, good_corona,
                                    groups= c("Latino", "Asian", "White")
)
# Plot the Results
plot(ei_rc_g_combine)
## End(No test)



