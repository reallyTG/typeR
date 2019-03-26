library(qmrparser)


### Name: pcAxisCubeToCSV
### Title: Exports a PC-AXIS cube into CSV in several files.
### Aliases: pcAxisCubeToCSV
### Keywords: PC-AXIS

### ** Examples


  name     <- system.file("extdata","datInSFexample6_1.px", package = "qmrparser")
  stream   <- streamParserFromFileName(name,encoding="UTF-8")
  cstream  <-  pcAxisParser(stream)
  if ( cstream$status == 'ok' ) {
    cube <- pcAxisCubeMake(cstream)
    
    pcAxisCubeToCSV(prefix="datInSFexample6_1",pcAxisCube=cube)     

  }



