library(apaTables)


### Name: apa.reg.table
### Title: Creates a regresion table in APA style
### Aliases: apa.reg.table

### ** Examples

# View top few rows of goggles data set
# from Discovering Statistics Using R
head(album)

# Single block example
blk1 <- lm(sales ~ adverts + airplay, data=album)
apa.reg.table(blk1)
apa.reg.table(blk1,filename="exRegTable.doc")

# Two block example, more than two blocks can be used
blk1 <- lm(sales ~ adverts, data=album)
blk2 <- lm(sales ~ adverts + airplay + attract, data=album)
apa.reg.table(blk1,blk2,filename="exRegBlocksTable.doc")

# Interaction product-term test with blocks
blk1 <- lm(sales ~ adverts + airplay, data=album)
blk2 <- lm(sales ~ adverts + airplay + I(adverts * airplay), data=album)
apa.reg.table(blk1,blk2,filename="exInteraction1.doc")

# Interaction product-term test with blocks and additional product terms
blk1<-lm(sales ~ adverts + airplay, data=album)
blk2<-lm(sales ~ adverts + airplay + I(adverts*adverts) + I(airplay*airplay), data=album)
blk3<-lm(sales~adverts+airplay+I(adverts*adverts)+I(airplay*airplay)+I(adverts*airplay),data=album)
apa.reg.table(blk1,blk2,blk3,filename="exInteraction2.doc")

#Interaction product-term test with single regression (i.e., semi-partial correlation focus)
blk1 <- lm(sales ~ adverts + airplay + I(adverts * airplay), data=album)
apa.reg.table(blk1,filename="exInteraction3.doc")




