library(olsrr)


### Name: ols_prep_dfbeta_outliers
### Title: DFBETAs plot outliers
### Aliases: ols_prep_dfbeta_outliers

### ** Examples

model <- lm(mpg ~ disp + hp + wt + qsec, data = mtcars)
dfb <- dfbetas(model)
n <- nrow(dfb)
threshold <- 2 / sqrt(n)
dbetas  <- dfb[, 1]
df_data <- tibble::tibble(obs = seq_len(n), dbetas = dbetas)
d <- ols_prep_dfbeta_data(df_data, threshold)
ols_prep_dfbeta_outliers(d)




