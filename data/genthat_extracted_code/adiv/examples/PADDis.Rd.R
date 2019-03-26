library(adiv)


### Name: PADDis
### Title: Functional Dissimilarity Measures for Presence-Absence Data
### Aliases: PADDis DJac Jac
### Keywords: models

### ** Examples

data(RPP16EE)
Com <- RPP16EE$Com
Dis <- as.dist(RPP16EE$Dis)
J <- Jac(Com)
DJ <- DJac(Com, Dis)

plot(c(as.matrix(DJ$J)[1,]), ylab="Dissimilarity", 
xlab="Plot-to-plot comparison", pch=15, type="b", 
ylim=c(0,1), main="Jaccard")

lines(c(as.matrix(J$J)[1,]), type="b", pch=18)

legend("bottomright", legend=c("P/A scores", "functional data"), 
pch=c(15,18), lty=1)

plot(c(as.matrix(DJ$JRepl)[1,]), ylab="Dissimilarity",
xlab="Plot-to-plot comparison", pch=15, type="b", 
ylim=c(0,1), main="Species replacement")

lines(c(as.matrix(J$JRepl)[1,]), type="b", pch=18)

legend("bottomright", legend=c("P/A scores", "functional data"), 
pch=c(15,18), lty=1)


#Use the following instruction to obtain all components:

PADDis(Com, Dis, method=0)



