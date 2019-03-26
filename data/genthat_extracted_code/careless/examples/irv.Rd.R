library(careless)


### Name: irv
### Title: Calculates the intra-individual response variability (IRV)
### Aliases: irv

### ** Examples

# calculate the irv over all items
irv_total <- irv(careless_dataset)

#calculate the irv over all items + calculate the irv for each quarter of the questionnaire
irv_split <- irv(careless_dataset, split = TRUE, num.split = 4)
boxplot(irv_split$irv4) #produce a boxplot of the IRV for the fourth quarter



