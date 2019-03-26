library(nat.templatebrains)


### Name: mirror_brain
### Title: Mirror 3D object around a given axis, optionally using a warping
###   registration
### Aliases: mirror_brain

### ** Examples

data(FCWB.demo)
# Simple mirror along the x i.e. medio-lateral axis
kcs20.flip=mirror_brain(kcs20, FCWB.demo, transform='flip')

## Full non-rigid mirroring to account for differences in shape/centering of
## template brain.
## Depends on nat.flybrains package and system CMTK installation
## Not run: 
##D library(nat.flybrains)
##D kcs20.right=mirror_brain(kcs20, FCWB, .progress='text')
##D plot3d(kcs20, col='red')
##D plot3d(kcs20.right, col='green')
##D # include surface plot of brain
##D plot3d(FCWB)
##D 
##D # Compare simple flip with full mirror
##D # This template brain is highly symmetric so these are almost identical
##D clear3d()
##D plot3d(kcs20.flip, col='blue')
##D plot3d(kcs20.right, col='green')
##D 
##D # Convert to JFRC2 and do the same
##D kcs20.jfrc2=xform_brain(kcs20, sample = FCWB, reference=JFRC2, .progress='text')
##D kcs20.jfrc2.right=mirror_brain(kcs20.jfrc2, JFRC2, .progress='text')
##D kcs20.jfrc2.flip=mirror_brain(kcs20.jfrc2, JFRC2, transform='flip')
##D clear3d()
##D # This time there is a bigger difference between the two transformations
##D plot3d(kcs20.jfrc2.flip, col='blue')
##D plot3d(kcs20.jfrc2.right, col='green')
##D # plot mushroom body neuropils as well
##D plot3d(JFRC2NP.surf, "MB.*_R", alpha=0.3, col='grey')
##D 
##D # Compare Euclidean distance between corresponding points in all neurons
##D diffs=xyzmatrix(kcs20.jfrc2.flip)-xyzmatrix(kcs20.jfrc2.right)
##D hist(sqrt(rowSums(diffs^2)), xlab='Distance /microns')
## End(Not run)



