library(sirt)


### Name: isop.scoring
### Title: Scoring Persons and Items in the ISOP Model
### Aliases: isop.scoring
### Keywords: ISOP model Nonparametric IRT

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset Reading
#############################################################################

data( data.read )
dat <- data.read

# Scoring according to the ISOP model
msc <- sirt::isop.scoring( dat )
# plot student scores
boxplot( msc$person$mpsc ~ msc$person$score )

#############################################################################
# EXAMPLE 2: Dataset students from CDM package | polytomous items
#############################################################################

library("CDM")
data( data.Students, package="CDM")
dat <- stats::na.omit(data.Students[, -c(1:2) ])

# Scoring according to the ISOP model
msc <- sirt::isop.scoring( dat )
# plot student scores
boxplot( msc$person$mpsc ~ msc$person$score )

# scoring with known scoring rule for activity items
items <- paste0( "act", 1:5 )
score.itemcat <- msc$score.itemcat
score.itemcat <- score.itemcat[ items, ]
msc2 <- sirt::isop.scoring( dat[,items], score.itemcat=score.itemcat )



