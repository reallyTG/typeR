library(rcompanion)


### Name: fullPTable
### Title: Convert a lower triangle matrix to a full matrix
### Aliases: fullPTable

### ** Examples

### Example with pairwise.wilcox.test
data(BrendonSmall)
BrendonSmall$Instructor = factor(BrendonSmall$Instructor,
                          levels = c('Brendon Small', 'Jason Penopolis',
                                     'Paula Small', 'Melissa Robbins', 
                                     'Coach McGuirk'))
P   = pairwise.wilcox.test(x = BrendonSmall$Score, g = BrendonSmall$Instructor)
PT  = P$p.value
PT
PT1 = fullPTable(PT)
PT1
library(multcompView)
multcompLetters(PT1)




