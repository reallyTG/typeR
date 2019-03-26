library(LMERConvenienceFunctions)


### Name: plotLMER3d.fnc
### Title: Dynamic 3d plot for 'mer' object.
### Aliases: plotLMER3d.fnc
### Keywords: hplot

### ** Examples

if(try(require(LCFdata,quietly=TRUE))){
	data(z)
	temp.dir <- tempdir()
	save(z,file=file.path(temp.dir,"lmer___z.rda"))

  plotLMER3d.fnc(pred = "LengthBc", intr = "WMCc", 
    plot.dat = "z", path = temp.dir)
  plotLMER3d.fnc(pred = "LengthBc", intr = "WMCc",
    plot.type = "persp", phi = 25, plot.dat = "z", 
    path = temp.dir)
  if(try(require(rgl,quietly=TRUE))){
    require(rgl)
    open3d()
    plotLMER3d.fnc(pred = "LengthBc", intr = "WMCc",
      plot.type = "persp3d", plot.dat = "z", path = temp.dir)
  }
}



