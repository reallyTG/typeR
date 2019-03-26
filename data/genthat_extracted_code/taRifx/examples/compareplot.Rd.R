library(taRifx)


### Name: compareplot
### Title: Bar plot divided by three groupings
### Aliases: compareplot

### ** Examples

library(datasets)
cw <- transform(ChickWeight,
 Time = cut(ChickWeight$Time,4)
 )
cw$Chick <- as.factor( sample(LETTERS[seq(3)], nrow(cw), replace=TRUE) )
levels(cw$Diet) <- c("Low Fat","Hi Fat","Low Prot.","Hi Prot.")
compareplot(~weight | Diet * Time * Chick,
 data.frame=cw ,
 main = "Chick Weights",
 box.show.mean=FALSE,
 box.show.whiskers=FALSE,
 box.show.box=FALSE
 )



