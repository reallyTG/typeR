library(qfasar)


### Name: prep_fa
### Title: Prepare fatty acid information analysis
### Aliases: prep_fa

### ** Examples

prep_fa(data.frame(fa = c("use_me", "fa_1", "fa_2", "fa_3"),
                   cc = c(1, 0.75, 1.25, 1.0),
                   use = c(1, 1, 1, 1)))

prep_fa(data.frame(fa = c("use_me", "fa_1", "fa_2", "fa_3"),
                   cc1 = c(0, 0.75, 1.25, 1.00),
                   cc2 = c(1, 1.2, 0.8, 0.9),
                   use_1 = c(0, 1, 1, 0),
                   use_2 = c(1, 1, 1, 0)))




