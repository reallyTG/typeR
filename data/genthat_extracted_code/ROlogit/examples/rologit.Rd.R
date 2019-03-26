library(ROlogit)


### Name: rologit
### Title: Fit RO-logit model and obtain heuristic residuals
### Aliases: rologit

### ** Examples

# Fit an RO-logit model to determine whether the glycaemic control of
# patients differs between medical and surgical wards.
data(inpat_bg)
# Divide patients into strata based on age, gender, duration of monitoring
# episodes, and frequency of daily BG measurements.
inpat_bg$group <- paste(inpat_bg$age_group, inpat_bg$sex, inpat_bg$los_group,
                        inpat_bg$bg_freq_group, sep = "|")
# Fit an RO-logit model with mean BG reading as the outcome and ward as the
# exposure:
obj <- rologit(yvar = "bg_mean", evar = "ward", svar = "group",
               dat = inpat_bg, initial.res.par = c(2, 2))
summary(obj)



