library(brainR)


### Name: writeWebGL_split
### Title: Write WebGL with split triangles
### Aliases: writeWebGL_split

### ** Examples

## Not run: 
##D #Brain Template from Copyright (C) 1993-2009 Louis Collins, 
##D #McConnell Brain Imaging Centre, 
##D #Montreal Neurological Institute, McGill University
##D #6th generation non-linear symmetric brain
##D template <- readNIfTI(system.file("MNI152_T1_2mm_brain.nii.gz", package="brainR")
##D , reorient=FALSE) 
##D dtemp <- dim(template)
##D ### 4500 - value that empirically value that presented a brain with gyri
##D ### lower values result in a smoother surface
##D brain <- contour3d(template, x=1:dtemp[1], y=1:dtemp[2], 
##D z=1:dtemp[3], level = 4500, alpha = 0.1, draw = FALSE)
##D drawScene.rgl(brain)
##D ### this would be the ``activation'' or surface you want to render - 
##D # hyper-intense white matter
##D contour3d(template, level = c(8200, 8250), 
##D alpha = c(0.5, 0.8), add = TRUE, color=c("yellow", "red"))
##D ### add text
##D text3d(x=dtemp[1]/2, y=dtemp[2]/2, z = dtemp[3]*0.98, text="Top")
##D text3d(x=-0.98, y=dtemp[2]/2, z = dtemp[3]/2, text="Right")
##D fname <- "knitted_webGL.html"
##D writeWebGL_split(dir=getwd(), filename =fname, 
##D template = system.file("my_template.html", package="brainR"), width=500, 
##D writeIt=TRUE)
##D browseURL(fname)
## End(Not run)



