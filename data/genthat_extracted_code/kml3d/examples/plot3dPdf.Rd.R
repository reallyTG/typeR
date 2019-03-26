library(kml3d)


### Name: plot3dPdf
### Title: ~ Function: plot3dPdf for ClusterLongData3d ~
### Aliases: plot3dPdf plot3dPdf,ClusterLongData3d-method
###   plot3dPdf,ClusterLongData3d,missing-method
###   plot3dPdf,ClusterLongData3d,numeric-method

### ** Examples

  ### Generating the data
  myCld3d <- gald3d(c(5,5,5))
  kml3d(myCld3d,3:4,1)

  ### Creation of the scene
  scene <- plot3dPdf(myCld3d,3)
  drawScene.rgl(scene)

  ### Export in '.azy' file
  saveTrianglesAsASY(scene)

  ### Creation of a '.prc' file
  # Open a console window, then run
  # asy -inlineimage -tex pdflatex scene.azy

  ### Creation of the LaTeX main document
  makeLatexFile()

  ### Creation of the '.pdf'
  # Open a console window, then run
  # pdfLatex main.tex



