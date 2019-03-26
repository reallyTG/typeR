library(shelltrace)


### Name: pma
### Title: Function to do an n-point moving average
### Aliases: pma

### ** Examples

Nile<-as.data.frame(Nile)
Nile<-cbind(rownames(Nile),Nile)
Nile_5pma<-pma(Nile,2,5)



