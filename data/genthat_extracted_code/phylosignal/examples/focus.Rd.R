library(phylosignal)


### Name: focusTraits
### Title: Focus on sub parts of a plot
### Aliases: focusTraits focusTree focusTips focusStop

### ** Examples

require(ape)
require(phylobase)
data(navic)
dat <- tdata(navic)
neidium.sp <- c("Neidium bisulcatum",
                "Neidium affine",
                "Neidium productum")
stauroneis.sp <- c("Stauroneis kriegeri",
                   "Stauroneis acuta",
                   "Stauroneis gracilior",
                   "Stauroneis phoenicenteron")
neidium.mean <- mean(dat[neidium.sp,])
stauroneis.mean <- mean(dat[stauroneis.sp, ])

dotplot(navic, center = FALSE, scale = FALSE, data.xlim= c(0, 6))

focusTree()
nodelabels(node=c(22, 32), pch = 20, cex = 3, col = c(2, 3))

focusTraits()
segments(x0 = neidium.mean, y0 = 14.5,
         x1 = neidium.mean, y1 = 17.5,
         col = 3, lty = "dashed", lwd = 2)
segments(x0 = stauroneis.mean, y0 = 2.5,
         x1 = stauroneis.mean, y1 = 7.5,
         col = 2, lty = "dashed", lwd = 2)

focusTips()
rect(xleft = 0, ybottom = 2.5,
     xright = 0.9, ytop = 7.5,
     col = "#FF000020", border = NA)
rect(xleft = 0, ybottom = 14.5,
     xright = 0.9, ytop = 17.5,
     col = "#00FF0020", border = NA)

focusStop()




