library(psychotools)


### Name: YouthGratitude
### Title: Measuring Gratitude in Youth
### Aliases: YouthGratitude
### Keywords: datasets

### ** Examples

data("YouthGratitude", package = "psychotools")
summary(YouthGratitude)

## modeling can be carried out using package lavaan
## Not run: 
##D ## remove cases with 'imputed' values (not in 1, ..., 9)
##D yg <- YouthGratitude[apply(YouthGratitude[, 4:28], 1, function(x) all(x ##D 
##D 
##D ## GQ-6
##D gq6_congeneric <- cfa(
##D   'f1 =~ gq6_1 + gq6_2 + gq6_3 + gq6_4 + gq6_5',
##D   data = yg, group = "agegroup", meanstructure = TRUE)
##D gq6_tauequivalent <- cfa(
##D   'f1 =~ gq6_1 + gq6_2 + gq6_3 + gq6_4 + gq6_5',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = "loadings")
##D gq6_parallel <- cfa(
##D   'f1 =~ gq6_1 + gq6_2 + gq6_3 + gq6_4 + gq6_5',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = c("loadings", "residuals", "lv.variances"))
##D anova(gq6_congeneric, gq6_tauequivalent, gq6_parallel)
##D t(sapply(
##D   list(gq6_congeneric, gq6_tauequivalent, gq6_parallel),
##D   function(m) fitMeasures(m)[c("chisq", "df", "cfi", "srmr")]
##D ))
##D 
##D ## GAC
##D gac_congeneric <- cfa(
##D   'f1 =~ gac_1 + gac_2 + gac_3',
##D   data = yg, group = "agegroup", meanstructure = TRUE)
##D gac_tauequivalent <- cfa(
##D   'f1 =~ gac_1 + gac_2 + gac_3',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = "loadings")
##D gac_parallel <- cfa(
##D   'f1 =~ gac_1 + gac_2 + gac_3',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = c("loadings", "residuals", "lv.variances"))
##D anova(gac_congeneric, gac_tauequivalent, gac_parallel)
##D t(sapply(
##D   list(gac_congeneric, gac_tauequivalent, gac_parallel),
##D   function(m) fitMeasures(m)[c("chisq", "df", "cfi", "srmr")]
##D ))
##D 
##D ## GRAT
##D grat_congeneric <- cfa(
##D   'f1 =~ losd_2 + losd_3 + losd_4 + losd_5 + losd_6
##D    f2 =~ sa_1 + sa_2 + sa_3 + sa_4 + sa_5 + sa_6
##D    f3 =~ ao_1 + ao_2 + ao_3 + ao_4',
##D   data = yg, group = "agegroup", meanstructure = TRUE)
##D grat_tauequivalent <- cfa(
##D   'f1 =~ losd_2 + losd_3 + losd_4 + losd_5 + losd_6
##D    f2 =~ sa_1 + sa_2 + sa_3 + sa_4 + sa_5 + sa_6
##D    f3 =~ ao_1 + ao_2 + ao_3 + ao_4',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = "loadings")
##D grat_parallel <- cfa(
##D   'f1 =~ losd_2 + losd_3 + losd_4 + losd_5 + losd_6
##D    f2 =~ sa_1 + sa_2 + sa_3 + sa_4 + sa_5 + sa_6
##D    f3 =~ ao_1 + ao_2 + ao_3 + ao_4',
##D   data = yg, group = "agegroup", meanstructure = TRUE,
##D   group.equal = c("loadings", "residuals", "lv.variances"))
##D anova(grat_congeneric, grat_tauequivalent, grat_parallel)
##D t(sapply(
##D   list(grat_congeneric, grat_tauequivalent, grat_parallel),
##D   function(m) fitMeasures(m)[c("chisq", "df", "cfi", "srmr")]
##D ))
## End(Not run)



