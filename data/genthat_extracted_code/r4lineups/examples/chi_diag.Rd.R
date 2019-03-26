library(r4lineups)


### Name: chi_diag
### Title: Chi-squared estimate of homogeneity of diagnosticity ratio
### Aliases: chi_diag

### ** Examples

#Target present data:
A <-  round(runif(100,1,6))
B <-  round(runif(70,1,5))
C <-  round(runif(20,1,4))
lineup_pres_list <- list(A, B, C)
rm(A, B, C)


#Target absent data:
A <-  round(runif(100,1,6))
B <-  round(runif(70,1,5))
C <-  round(runif(20,1,4))
lineup_abs_list <- list(A, B, C)
rm(A, B, C)

#Pos list
lineup1_pos <- c(1, 2, 3, 4, 5, 6)
lineup2_pos <- c(1, 2, 3, 4, 5)
lineup3_pos <- c(1, 2, 3, 4)
pos_list <- list(lineup1_pos, lineup2_pos, lineup3_pos)
rm(lineup1_pos, lineup2_pos, lineup3_pos)

#Nominal size:
k <- c(6, 5, 4)

#Use diag param helper function to get data (n11, n21, n12, n22):
linedf <- diag_param(lineup_pres_list, lineup_abs_list, pos_list, k)

#Get ln(d), variance of ln(d) & d weights:
ratio <- ln_diag_ratio(linedf)
var <- var_lnd(linedf)
wi <- d_weights(linedf)

#Bind estimates into one df of 3 rows & x observations
#(see Details above)
df <- t(cbind(ratio, var, wi))

#Call:
chi_diag(df)




