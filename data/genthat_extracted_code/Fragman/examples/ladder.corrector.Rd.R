library(Fragman)


### Name: ladder.corrector
### Title: Ladder corrector attached to R environment
### Aliases: ladder.corrector

### ** Examples

data(my.plants)
my.plants <- my.plants[1:2]
my.ladder <- c(50, 75, 100, 125, 129, 150, 175, 200, 225, 250, 275, 300, 325, 350, 375)
ladder.info.attach(stored=my.plants, ladder=my.ladder, ladd.init.thresh=300)
## now if something goes wrong use the corrector:
#ladder.corrector(stored=my.plants, 
#to.correct="FHN152-CPN01_01A_GH1x35_152-148-209_717-704-793_367-382-381.fsa", 
#ladder=my.ladder)



