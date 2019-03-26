library(directlabels)


### Name: geom_dl
### Title: geom dl
### Aliases: geom_dl

### ** Examples

if(require(ggplot2)){
  vad <- as.data.frame.table(VADeaths)
  names(vad) <- c("age","demographic","deaths")
  ## color + legend
  leg <- ggplot(vad,aes(deaths,age,colour=demographic))+
    geom_line(aes(group=demographic))+
    xlim(8,80)
  print(direct.label(leg,list("last.points",rot=30)))
  ## this is what direct.label is doing internally:
  labeled <- leg+
    geom_dl(aes(label=demographic), method=list("last.points",rot=30))+
    scale_colour_discrete(guide="none")
  print(labeled)
  ## no color, just direct labels!
  p <- ggplot(vad,aes(deaths,age))+
    geom_line(aes(group=demographic))+
    geom_dl(aes(label=demographic),method="top.qp")
  print(p)
  ## add color:
  p+aes(colour=demographic)+
    scale_colour_discrete(guide="none")
  ## add linetype:
  p+aes(linetype=demographic)+
    scale_linetype(guide="none")
  ## no color, just direct labels
  library(nlme)
  bwbase <- ggplot(BodyWeight,aes(Time,weight,label=Rat))+
    geom_line(aes(group=Rat))+
    facet_grid(.~Diet)
  bw <- bwbase+geom_dl(method="last.qp")
  print(bw)
  ## add some more direct labels
  bw2 <- bw+geom_dl(method="first.qp")
  print(bw2)
  ## add color
  colored <- bw2+aes(colour=Rat)+
    scale_colour_discrete(guide="none")
  print(colored)
  ## or just use direct.label if you use color:
  direct.label(bwbase+aes(colour=Rat),dl.combine("first.qp","last.qp"))

  ## iris data example
  giris <- ggplot(iris,aes(Petal.Length,Sepal.Length))+
    geom_point(aes(shape=Species))
  giris.labeled <- giris+
    geom_dl(aes(label=Species),method="smart.grid")+
    scale_shape_manual(values=c(setosa=1,virginica=6,versicolor=3),
                       guide="none")
  ##png("~/R/directlabels/www/scatter-bw-ggplot2.png",h=503,w=503)
  print(giris.labeled)
  ##dev.off()
}



