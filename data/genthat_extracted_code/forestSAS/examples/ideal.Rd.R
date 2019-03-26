library(forestSAS)


### Name: ideal
### Title: A forest spatial structure index characterizing distribution of
###   ideal state for tree attributies.
### Aliases: ideal

### ** Examples

health1<-c("poor","poor","poor","poor")
health2<-c("poor","poor","poor","excellent")
health3<-c("poor","poor","good","excellent")
health4<-c("poor","excellent","good","excellent")
health5<-c("good","excellent","good","excellent")

ideal1<-ideal(health1,para=c("good","excellent"))
ideal1
ideal2<-ideal(health2,para=c("good","excellent"))
ideal2
ideal3<-ideal(health3,para=c("good","excellent"))
ideal3
ideal4<-ideal(health4,para=c("good","excellent"))
ideal4
ideal5<-ideal(health5,para=c("good","excellent"))
ideal5



