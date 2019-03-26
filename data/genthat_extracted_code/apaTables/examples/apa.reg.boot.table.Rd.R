library(apaTables)


### Name: apa.reg.boot.table
### Title: Creates a regresion table in APA style with bootstrap confidence
###   intervals
### Aliases: apa.reg.boot.table

### ** Examples


#Note: number.samples = 50 below.
#      However, please use a value of 1000 or higher

# View top few rows of goggles data set
# from Discovering Statistics Using R
set.seed(1)
head(album)

# Single block example
blk1 <- lm(sales ~ adverts + airplay, data=album)
## No test: 
apa.reg.boot.table(blk1)
## End(No test)
## No test: 
apa.reg.boot.table(blk1,filename="exRegTable.doc")
## End(No test)

# Two block example, more than two blocks can be used
blk1 <- lm(sales ~ adverts, data=album)
blk2 <- lm(sales ~ adverts + airplay + attract, data=album)
## No test: 
apa.reg.boot.table(blk1,blk2,filename="exRegBlocksTable.doc")
## End(No test)

# Interaction product-term test with blocks
blk1 <- lm(sales ~ adverts + airplay, data=album)
blk2 <- lm(sales ~ adverts + airplay + I(adverts * airplay), data=album)
## No test: 
apa.reg.boot.table(blk1,blk2,filename="exInteraction1.doc")
## End(No test)



