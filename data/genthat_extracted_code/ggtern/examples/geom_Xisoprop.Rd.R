library(ggtern)


### Name: geom_Xisoprop
### Title: Fixed Value Isoproportion Lines
### Aliases: geom_Xisoprop geom_Tisoprop GeomTisoprop geom_Lisoprop
###   GeomLisoprop geom_Risoprop GeomRisoprop
### Keywords: datasets

### ** Examples

data(Feldspar)
ggtern(data=Feldspar,aes(Ab,An,Or)) +
geom_Tisoprop(value=0.5) +
geom_Lisoprop(value=0.5) +
geom_Risoprop(value=0.5) +
geom_point()



