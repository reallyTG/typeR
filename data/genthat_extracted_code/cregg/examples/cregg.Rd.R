library(cregg)


### Name: cj
### Title: Simple Conjoint Analyses and Visualization
### Aliases: cj cregg-package cregg cj
### Keywords: package

### ** Examples

## No test: 
# load data
requireNamespace("ggplot2")
data("immigration")
data("taxes")

# calculate MMs
f1 <- ChosenImmigrant ~ Gender + Education + 
         LanguageSkills + CountryOfOrigin + Job + JobExperience + 
         JobPlans + ReasonForApplication + PriorEntry
d1 <- cj(immigration, f1, id = ~ CaseID, estimate = "mm", h0 = 0.5)
# plot MMs
plot(d1, vline = 0.5)

# calculate MMs for survey-weighted data
d1 <- cj(taxes, chose_plan ~ taxrate1 + taxrate2 + taxrate3 +
         taxrate4 + taxrate5 + taxrate6 + taxrev, id = ~ ID,
         weights = ~ weight, estimate = "mm", h0 = 0.5)
# plot MMs
plot(d1, vline = 0.5)

# MMs split by profile number
stacked <- cj(immigration, f1, id = ~ CaseID,
              estimate = "mm", by = ~ contest_no)

## plot with grouping
plot(stacked, group = "contest_no", vline = 0.5, feature_headers = FALSE)

## plot with facetting
plot(stacked) + ggplot2::facet_wrap(~contest_no, nrow = 1L)

# estimate AMCEs
d2 <- cj(immigration, f1, id = ~ CaseID)

# plot AMCEs
plot(d2)

## subgroup analysis
immigration$ethnosplit <- cut(immigration$ethnocentrism, 2)
x <- cj(na.omit(immigration), ChosenImmigrant ~ Gender + Education + LanguageSkills,
        id = ~ CaseID, estimate = "mm", h0 = 0.5, by = ~ ethnosplit)
plot(x, group = "ethnosplit", vline = 0.5)
## End(No test)



