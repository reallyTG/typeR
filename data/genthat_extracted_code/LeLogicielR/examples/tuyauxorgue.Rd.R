library(LeLogicielR)


### Name: tuyauxorgue
### Title: Diagramme en tuyaux d'orgues
### Aliases: tuyauxorgue

### ** Examples

data(NUTRIAGE)
attach(NUTRIAGE)
situation <- as.factor(situation)
levels(situation) <- c("seul","couple","famille","autre")
col <- c("gray","orangered","lightgoldenrodyellow","red")
tuyauxorgue(situation,col)
detach(NUTRIAGE)



