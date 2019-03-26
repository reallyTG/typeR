library(sparkTable)


### Name: newSparkBar
### Title: Functions to create new Spark object
### Aliases: newSparkBar newSparkLine newSparkBox newSparkHist

### ** Examples

  ## Not run: 
##D   data(pop)
##D   x <- pop[pop[,2]=="Insgesamt",3]
##D 
##D   ### SparkLine
##D   a <- newSparkLine(values=x, pointWidth=8)
##D   export(a, outputType='png', filename='testLine1')
##D 
##D   a <- setParameter(a, sample(1:10, 15, replace=TRUE), type='values')
##D   getParameter(a, type='values')
##D 
##D   a <- setParameter(a, c("darkred", "darkgreen","darkblue", "white", "black", "red"),
##D     type='allColors')
##D   getParameter(a, type='allColors')
##D 
##D   a <- setParameter(a, 3, type='pointWidth')
##D   a <- setParameter(a, 1, type='lineWidth')
##D 
##D   export(a, outputType="pdf", filename='testLine2')
##D 
##D   a <- setParameter(a, 6, type='width')
##D   a <- setParameter(a, .6, type='height')
##D   export(a, outputType='eps', filename='testLine2')
##D 
##D   ### SparkBar
##D   b <- newSparkBar(values=x-min(x))
##D   getParameter(b, type='values')
##D 
##D   b <- setParameter(b, c("darkred", "darkgreen","black"), type='barCol')
##D   export(b, outputType='pdf', filename='testBar1')
##D 
##D   b <- setParameter(b, 0:10, type='values')
##D   export(b, outputType='pdf', filename='testBar2')
##D 
##D   b <- setParameter(b, 0:-10, type='values')
##D   export(b, outputType='pdf', filename='testBar3')
##D 
##D   ### SparkBox
##D   cc <- newSparkBox(values=x)
##D   cc <- setParameter(cc, "darkgreen", type='outCol')
##D   getParameter(cc, type='outCol')
##D   cc <- setParameter(cc, c("black","red"), type='boxCol')
##D 
##D   export(cc, outputType='pdf', filename='testBox1')
##D 
##D   cc <- setParameter(cc, c("black","darkgreen"), type='boxCol')
##D   cc <- setParameter(cc, "darkred", type='outCol')
##D   export(cc, outputType='pdf', filename='testBox2')
##D 
##D   ###SparkHist
##D   hh <- newSparkHist(values=rnorm(100))
##D   export(hh, outputType='pdf', filename='testHist1')
##D   
## End(Not run)



