library(STB)


### Name: plot.stbVCA
### Title: Plot Objects of Class 'stbVCA'.
### Aliases: plot.stbVCA

### ** Examples

## Not run: 
##D library(VCA)
##D data(dataEP05A2_1)
##D fit <- anovaVCA(y~day/run, dataEP05A2_1)
##D fit
##D 
##D # use studentized conditional residuals
##D stb.obj1 <- stb.VCA(fit, term="cond", mode="student", N=1000)
##D 
##D # plot it again
##D plot(stb.obj1)
##D 
##D # use random effects "day" and apply standardization
##D stb.obj2 <- stb.VCA(fit, term="day", mode="stand", N=1000)
##D 
##D # plot it again
##D plot(stb.obj2)
##D 
##D # initially, request QQ-plot with STB
##D stb.obj3 <- stb.VCA(fit, term="day", mode="stand", N=1000, type=1)
##D 
##D # now request plotting of the residual plot as well
##D # catch computation result which are invisibly returned
##D stb.obj4 <- plot(stb.obj3, type=3)
##D 
##D # individualize the appearance of the plot
##D plot(stb.obj4, sti.lpos="top", col="darkblue", out.pch=17, out.col="green") 
## End(Not run)



