library(VARSEDIG)


### Name: VARSEDIG
### Title: Variable selection to discriminate among taxonomic groups
### Aliases: VARSEDIG
### Keywords: VARSEDIG

### ** Examples


data(characiformes)

VARSEDIG(data = characiformes , variables = c("M2","M3","M4","M5","M6","M7","M8","M9","M10",
"M11","M12","M13","M14","M15","M16","M17","M18","M19","M20","M21","M22","M23",
"M24","M25","M26","M27","M28"), group="Species" , group1= "Moenkhausia oligolepis",
group2="Moenkhausia dichroura", LEGENDd=c("x='topright'", "legend = dati",
"col = COLORB", "lty=lty", "bty='n'", "cex=1.2", "text.font= 3"),
LEGENDs=c("x='topright'", "legend=unique(datosF[,'Group'])", "col = color1",
"pch = pcht", "bty='n'", "cex=1.2", "text.font=3"), LEGENDr=c("x='topright'",
"legend = dati", "col=col", "pch= c(16,16)", "bty='n'", "cex=1.2", "text.font=3"),
XLIMs=c(-1.2,1.2), YLIMs=c(-1.3,1.3), BIVTEST12=c("br=br", "cex=1.1",
"col=colbiv", "sub=sub", "Pcol=Pcol"), BIVTEST21=c("br=br", "cex=1.1",
"col=colbiv", "sub=sub", "Pcol=Pcol"), colbiv="blue", ellipse=TRUE, convex=FALSE)




