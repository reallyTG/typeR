library(longitudinalData)


### Name: plot3dPdf
### Title: ~ Function: plot3dPdf for LongData ~
### Aliases: plot3dPdf plot3dPdf,LongData3d-method
###   plot3dPdf,LongData3d,missing-method
###   plot3dPdf,LongData3d,numeric-method
###   plot3dPdf,LongData3d,Partition-method

### ** Examples

  ### Generating the data
  data(artificialJointLongData)
  myLd <- longData3d(artificialJointLongData,timeInData=list(var1=2:12,var2=13:23))
  part <- partition(rep(1:3,each=50))
  plotTrajMeans3d(myLd,part)

  ### Creation of the scene
  scene <- plot3dPdf(myLd,part)
  drawScene.rgl(scene)

  ### Export in '.asy' file
  saveTrianglesAsASY(scene)

  ### Creation of a '.prc' file
  # Open a console, then run:
  # 'asy -inlineimage -tex pdflatex scene.asy'

  ### Creation of the LaTeX main document
  makeLatexFile()

  ### Creation of the '.pdf'
  # Open a console window, then run
  # pdfLatex main.tex



