library(mason)


### Name: add_settings
### Title: Add analysis settings to the blueprint
### Aliases: add_settings add_settings.gee_bp add_settings.cor_bp
###   add_settings.glm_bp add_settings.pls_bp add_settings.t.test_bp

### ** Examples


design(iris, 'gee') %>%
 add_settings('Species', family = binomial('logit'), conf.int = FALSE)

ds <- design(iris, 'cor')
ds <- add_settings(ds, method = 'spearman')

ds <- design(iris, 't.test')
add_settings(ds, paired = TRUE)
add_settings(ds)




