library(riverdist)


### Name: riverdistancetofrom
### Title: River Distance Matrix between Two Datasets
### Aliases: riverdistancetofrom

### ** Examples

data(Gulk)

streamlocs.seg <- c(1,8,11)
streamlocs.vert <- c(50,70,90)
streamlocs.ID <- c("A","B","C")

fish.seg <- c(1,4,9,12,14)
fish.vert <- c(10,11,12,13,14)
fish.ID <- c("fish1","fish2","fish3","fish4","fish5")

riverdistancetofrom(seg1=streamlocs.seg, vert1=streamlocs.vert,
  seg2=fish.seg, vert2=fish.vert, rivers=Gulk, ID1=streamlocs.ID, ID2=fish.ID)

logi1 <- streamlocs.ID=="B" | streamlocs.ID=="C"
logi2 <- fish.ID!="fish3"

riverdistancetofrom(seg1=streamlocs.seg, vert1=streamlocs.vert,
  seg2=fish.seg, vert2=fish.vert, rivers=Gulk, logical1=logi1, logical2=logi2,
  ID1=streamlocs.ID, ID2=fish.ID)



