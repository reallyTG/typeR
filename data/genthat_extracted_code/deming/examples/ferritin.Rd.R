library(deming)


### Name: ferritin
### Title: Validation of a ferritin assay
### Aliases: ferritin ferritin2
### Keywords: datasets

### ** Examples

data(ferritin)
temp <- ferritin[ferritin$period <4,]
plot(temp$old.lot, temp$new.lot, type='n', log='xy',
     xlab="Old lot", ylab="New Lot")
text(temp$old.lot, temp$new.lot, temp$period,
         col=temp$period)



