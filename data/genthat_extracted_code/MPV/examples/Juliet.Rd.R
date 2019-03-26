library(MPV)


### Name: Juliet
### Title: Juliet
### Aliases: Juliet
### Keywords: datasets

### ** Examples

summary(Juliet)

#Split apart the Batch factor for easier use.
juliet<-split(Juliet,Juliet$Batch)
juliet1<-juliet$'1'
juliet2<-juliet$'2'
juliet3<-juliet$'3'

plot(LAA1~LAA2,data=Juliet)
plot(LAA1~LAA2,data=juliet1)




