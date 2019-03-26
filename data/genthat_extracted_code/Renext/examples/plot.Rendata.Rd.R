library(Renext)


### Name: plot.Rendata
### Title: Plot a Rendata object
### Aliases: plot.Rendata

### ** Examples

if (require(XML)) {
   ## use 'index.xml' file shipped with Renext
   dir1 <- system.file("Rendata", package = "Renext")
   BrestNew <- readXML(name = "Brest", dir = dir1)
   plot(BrestNew)
   GaronneNew <- readXML(name = "Garonne", dir = dir1)
   plot(GaronneNew)
   test1 <- readXML(name = "test1", dir = dir1)
   plot(test1)
}



