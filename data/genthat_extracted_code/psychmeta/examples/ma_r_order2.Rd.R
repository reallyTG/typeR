library(psychmeta)


### Name: ma_r_order2
### Title: Second-order meta-analysis function for correlations
### Aliases: ma_r_order2

### ** Examples

## Analysis of the validity of conscientiousness as a predictor of job performance in East Asia
out <- ma_r_order2(k = k, r = r_bar_i, rho = rho_bar_i, var_r = var_r,
                   var_r_c = NULL, ma_type = c("bb", "ad"),
                   sample_id = NULL, moderators = NULL,
                   construct_x = NULL, construct_y = NULL,
                   data = dplyr::filter(data_r_oh_2009, Predictor == "Conscientiousness"))
summary(out)

## Analysis of the validity of the Big Five traits as predictors of job performance in East Asia
out <- ma_r_order2(k = k, r = r_bar_i, rho = rho_bar_i, var_r = var_r,
                   var_r_c = NULL, ma_type = c("bb", "ad"),
                   sample_id = NULL, moderators = NULL, construct_x = Predictor,
                   data = data_r_oh_2009)
summary(out)

## Analysis of the average validity of the Big Five traits as predictors of
## job performance by Eastern Asian country
out <- ma_r_order2(k = k, r = r_bar_i, rho = rho_bar_i, var_r = var_r,
                   var_r_c = NULL, ma_type = c("bb", "ad"),
                   sample_id = NULL, moderators = "Country", data = data_r_oh_2009)
summary(out)



