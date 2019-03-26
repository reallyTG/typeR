library(deTestSet)


### Name: emep
### Title: Emep MSC-W Ozone Chemistry Problem, ODE
### Aliases: emep
### Keywords: utilities

### ** Examples

out <- emep()
plot(out, lwd = 2, col = "darkblue", 
  which = c("NO", "NO2", "SO2", "CH4", "O3", "N2O5"))

plot(out, col = "darkblue", lwd = 2, which = 1:16)
mtext(side = 3,line = -1.5, "emep", cex = 1.25, outer = TRUE)

# compare with reference solution (component 36 and 38 not included)       
refsol <- reference("emep")
inderr <- c(1:35,37,39:66)
max(abs(out[nrow(out),inderr+1] - refsol[inderr])/refsol[inderr])     




