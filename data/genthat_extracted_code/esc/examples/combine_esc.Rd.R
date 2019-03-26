library(esc)


### Name: combine_esc
### Title: Combine one or more 'esc' objects into a data frame
### Aliases: combine_esc

### ** Examples

e1 <- esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40,
              grp2no = 45, study = "Study 1")
e2 <- esc_2x2(grp1yes = 30, grp1no = 50, grp2yes = 40, grp2no = 45,
              es.type = "or", study = "Study 2")
e3 <- esc_t(p = 0.03, grp1n = 100, grp2n = 150, study = "Study 3")
e4 <- esc_mean_sd(grp1m = 7, grp1sd = 2, grp1n = 50, grp2m = 9, grp2sd = 3,
                  grp2n = 60, es.type = "logit", study = "Study 4")

combine_esc(e1, e2, e3, e4)




