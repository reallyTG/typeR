library(nat.templatebrains)


### Name: xform_brain
### Title: Transform 3D object between template brains
### Aliases: xform_brain

### ** Examples

## depends on nat.flybrains package and system CMTK installation
## Not run: 
##D ## reformat neurons
##D ##
##D library(nat.flybrains)
##D # Plot Kenyon cells in their original FCWB template brain
##D nopen3d()
##D plot3d(kcs20)
##D plot3d(FCWB)
##D # Convert to JFCR2 template brain
##D kcs20.jfrc2=xform_brain(kcs20, sample = FCWB, reference=JFRC2, .progress='text')
##D # now plot in the new JFRC2 space
##D nopen3d()
##D plot3d(kcs20.jfrc2)
##D plot3d(JFRC2)
##D # compare with the untransformed neurons
##D plot3d(kcs20)
##D # plot with neuropil sub regions for the left mushroom body
##D clear3d()
##D plot3d(kcs20.jfrc2)
##D # nb "MB.*_L" is a regular expression
##D plot3d(JFRC2NP.surf, "MB.*_L", alpha=0.3)
##D # compare with originals - briging registration is no perfect in peduncle
##D nopen3d()
##D plot3d(kcs20)
##D plot3d(FCWBNP.surf, "MB.*_L", alpha=0.3)
##D 
##D 
##D ## reformat image examples
##D # see ?cmtk.reformatx for details of all additional arguments
##D xform_brain('in.nrrd', sample=FCWB, ref=JFRC2, output='out.nrrd', Verbose=F)
##D 
##D # use nearest neighbour interpolation for label field
##D xform_brain('labels.nrrd', sample=FCWB, ref=JFRC2, output='out.nrrd', interpolation='nn')
##D 
##D # use binary mask to restrict (and speed up) reformatting
##D xform_brain('in.nrrd', sample=FCWB, ref=JFRC2, output='out.nrrd', mask='neuropil.nrrd')
## End(Not run)



