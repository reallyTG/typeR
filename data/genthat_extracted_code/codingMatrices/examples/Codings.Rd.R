library(codingMatrices)


### Name: Codings
### Title: Coding matrix functions for factors in linear model formulae
### Aliases: Codings code_control code_control_last code_diff
###   code_diff_forward code_helmert code_helmert_forward code_deviation
###   code_deviation_first code_poly contr.diff

### ** Examples

(M <- code_control(5))
mean_contrasts(M)
(M <- stats::contr.treatment(5))
mean_contrasts(M)  ## same contrasts; different averaging vector.
mean_contrasts(stats::contr.helmert(6))  ## Interpretation obscure
mean_contrasts(code_helmert(6))          ## each mean with the average preceding
mean_contrasts(code_helmert_forward(6))  ## each mean with the averave succeeding



