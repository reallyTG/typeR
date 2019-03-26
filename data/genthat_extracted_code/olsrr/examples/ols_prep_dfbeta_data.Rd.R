library(olsrr)


### Name: ols_prep_dfbeta_data
### Title: DFBETAs plot data
### Aliases: ols_prep_dfbeta_data

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
dfb <- dfbetas(model)
n <- nrow(dfb)
threshold <- 2 / sqrt(n)
dbetas  <- dfb[, 1]
df_data <- tibble::tibble(obs = seq_len(n), dbetas = dbetas)
ols_prep_dfbeta_data(df_data, threshold)




