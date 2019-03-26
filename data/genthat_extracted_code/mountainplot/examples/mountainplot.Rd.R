library(mountainplot)


### Name: mountainplot
### Title: Mountainplot
### Aliases: mountainplot mountainplot.formula mountainplot.numeric

### ** Examples


data(singer, package = "lattice")
singer <- within(singer, {
section <- voice.part
section <- gsub(" 1", "", section)
section <- gsub(" 2", "", section)
section <- factor(section)
})
mountainplot(~height, data = singer, type='b')
mountainplot(~height|voice.part, data = singer, type='p')
mountainplot(~height|section, data = singer, groups=voice.part, type='l',
auto.key=list(columns=4), as.table=TRUE)




