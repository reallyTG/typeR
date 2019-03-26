library(TRAMPR)


### Name: TRAMPknowns
### Title: TRAMPknowns Objects
### Aliases: TRAMPknowns labels.TRAMPknowns summary.TRAMPknowns
### Keywords: classes

### ** Examples

## This example builds a TRAMPknowns object from completely artificial
## data:

## The info data.frame:
knowns.info <-
  data.frame(knowns.pk=1:8,
             species=rep(paste("Species", letters[1:5]), length=8))
knowns.info

## The data data.frame:
knowns.data <- expand.grid(knowns.fk=1:8,
                           primer=c("ITS1F", "ITS4"),
                           enzyme=c("BsuRI", "HpyCH4IV"))
knowns.data$size <- runif(nrow(knowns.data), min=40, max=800)

## Construct the TRAMPknowns object:
demo.knowns <- TRAMPknowns(knowns.data, knowns.info, warn.factors=FALSE)

## A plot of the pretend knowns:
plot(demo.knowns, cex=1, group.clusters=TRUE)



