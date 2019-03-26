library(cregg)


### Name: plot.cj_amce
### Title: Plot AMCE estimates, MM descriptives, and frequency plots
### Aliases: plot.cj_amce plot.cj_mm plot.cj_freqs plot.cj_diffs
###   plot.cj_freqs plot.cj_mm

### ** Examples

## No test: 
# load data
data("immigration")

# calculate MMs
d1 <- mm(immigration, ChosenImmigrant ~ Gender + Education + 
         LanguageSkills + CountryOfOrigin + Job + JobExperience + 
         JobPlans + ReasonForApplication + PriorEntry, id = ~ CaseID)

# plot MMs
## simple plot
plot(d1)
## plot with facetting by feature
plot(d1, feature_headers = FALSE) + 
  ggplot2::facet_wrap(~feature, ncol = 1L, 
                      scales = "free_y", strip.position = "right")

# MMs split by profile number
stacked <- cj(immigration, ChosenImmigrant ~ Gender + 
              Education + LanguageSkills + CountryOfOrigin + Job + JobExperience + 
              JobPlans + ReasonForApplication + PriorEntry, id = ~ CaseID,
              estimate = "mm", by = ~ contest_no)

## plot with grouping
plot(stacked, group = "contest_no", feature_headers = FALSE)

## plot with facetting
plot(stacked) + ggplot2::facet_wrap(~contest_no, nrow = 1L)

# estimate AMCEs over different subsets of data
reasons12 <- subset(immigration, ReasonForApplication %in% levels(ReasonForApplication)[1:2])
d2_1 <- cj(immigration, ChosenImmigrant ~ CountryOfOrigin, id = ~ CaseID)
d2_2 <- cj(reasons12, ChosenImmigrant ~ CountryOfOrigin, id = ~ CaseID,
           feature_labels = list(CountryOfOrigin = "Country Of Origin"))
d2_1$reasons <- "1,2,3"
d2_2$reasons <- "1,2"
plot(rbind(d2_1, d2_2), group = "reasons")
## End(No test)



