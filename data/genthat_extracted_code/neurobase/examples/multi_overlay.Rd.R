library(neurobase)


### Name: multi_overlay
### Title: Create Multi-Image Plot with Overlays
### Aliases: multi_overlay

### ** Examples

## Not run: 
##D 
##D  if (require(brainR)) {
##D    visits = 1:3
##D    y = paste0("Visit_", visits, ".nii.gz")
##D    y = system.file(y, package = "brainR")
##D    y = lapply(y, readnii)
##D 
##D    y = lapply(y, function(r){
##D      pixdim(r) = c(0, rep(1, 3), rep(0, 4))
##D      dropImageDimension(r)
##D    })
##D 
##D    x = system.file("MNI152_T1_1mm_brain.nii.gz", 
##D                  package = "brainR")
##D    x = readnii(x)
##D    mask = x >0
##D    x = lapply(visits, function(tmp){
##D        x
##D    })
##D    alpha = function(col, alpha = 1) {
##D        cols = t(col2rgb(col, alpha = FALSE)/255)
##D        rgb(cols, alpha = alpha)
##D    }
##D    multi_overlay(x, y, 
##D          col.y = alpha(hotmetal(), 0.5),
##D          mask = mask, 
##D          main = paste0("\n", "Visit ", visits),
##D          text = LETTERS[visits],
##D          text.x = 0.9,
##D          text.y = 0.1,
##D          text.cex = 3)
##D  }
## End(Not run)



