library(multcomp)


### Name: fattyacid
### Title: Fatty Acid Content of Bacillus simplex.
### Aliases: fattyacid
### Keywords: datasets

### ** Examples


if (require("sandwich")) {
    data("fattyacid")
    ### all-pairwise comparisons of the means of fatty acid content 
    ### FA between different putative ecotypes PE accounting for 
    ### heteroscedasticity by using a heteroscedastic consistent 
    ### covariance estimation
    amod <- aov(FA ~ PE, data = fattyacid)
    amod_glht <- glht(amod, mcp(PE = "Tukey"), vcov = vcovHC)
    summary(amod_glht)

    ### simultaneous confidence intervals for the differences of 
    ### means of fatty acid content between the putative ecotypes
    confint(amod_glht)
}



