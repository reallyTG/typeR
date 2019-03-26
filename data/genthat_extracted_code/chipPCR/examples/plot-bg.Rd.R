library(chipPCR)


### Name: plot.bg
### Title: Plot 'bg' objects
### Aliases: plot.bg plot,bg-method plot,bg,ANY-method
### Keywords: hplot amplification quality

### ** Examples


#step-by-step plotting bg object

res <- AmpSim(cyc = 1:40, Cq = 25)
background <- bg.max(res)

plot(background)

#above is equivalent of below
plot(rounder(inder(res)), xlab = "Cycles", 
     ylab = "Fluorescence",
     pch = 20, legend = FALSE)

abline(v = slot(background, "bg.start"))
  text(slot(background, "bg.start"), 0.2, "Background start", pos = 4)
abline(v = slot(background, "bg.stop"), col = "blue")
  text(slot(background, "bg.stop"), 0.25, "Background stop", pos = 4, 
       col = "blue")
abline(v = slot(background, "amp.stop"), col = "green")
  text(slot(background, "amp.stop"), 0.3, "Plateau transition", pos = 4, 
       col = "green")
legend(4, 1, c("Raw data", "First derivative", "Second derivative"), 
       pch = rep(20, 3), col = c(1, 2, 4))




