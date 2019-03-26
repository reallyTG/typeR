library(WRS2)


### Name: bwtrim
### Title: A robust two-way mixed ANOVA using trimmed means.
### Aliases: bwtrim tsplit sppba sppbb sppbi
### Keywords: models

### ** Examples

## data need to be on long format
pictureLong <- reshape(picture, direction = "long", varying = list(3:4), idvar = "case", 
timevar = c("pictype"), times = c("couple", "alone"))
colnames(pictureLong)[4] <- "friend_requests"

## 2-way within-between subjects ANOVA
bwtrim(friend_requests ~ relationship_status*pictype, id = case, data = pictureLong)

## between groups effect only (MOM estimator)
sppba(friend_requests ~ relationship_status*pictype, case, data = pictureLong)

## within groups effect only (MOM estimator)
sppbb(friend_requests ~ relationship_status*pictype, case, data = pictureLong)

## interaction effect only (MOM estimator)
sppbi(friend_requests ~ relationship_status*pictype, case, data = pictureLong)




