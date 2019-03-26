library(plotrix)


### Name: fan.plot
### Title: Display a fan plot
### Aliases: fan.plot
### Keywords: misc

### ** Examples

 iucn.df<-data.frame(area=c("Africa","Asia","Europe","N&C America",
  "S America","Oceania"),threatened=c(5994,7737,1987,4716,5097,2093))
 fan.plot(iucn.df$threatened,max.span=pi,
  labels=paste(iucn.df$area,iucn.df$threatened,sep="-"),
  main="Threatened species by geographical area (fan.plot)",ticks=276)



