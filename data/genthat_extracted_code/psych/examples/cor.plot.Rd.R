library(psych)


### Name: cor.plot
### Title: Create an image plot for a correlation or factor matrix
### Aliases: cor.plot corPlot cor.plot.upperLowerCi corPlotUpperLowerCi
### Keywords: multivariate hplot

### ** Examples

corPlot(Thurstone,main="9 cognitive variables from Thurstone") 
#just blue implies positive manifold
#select just some variables to plot
corPlot(Thurstone, zlim=c(0,1),main="9 cognitive variables from Thurstone",select=c(1:3,7:9))
#now show a non-symmetric plot
corPlot(Thurstone[4:9,1:3], zlim=c(0,1),main="9 cognitive variables
 from Thurstone",numbers=TRUE,symmetric=FALSE)

#Two ways of including stars to show significance
#From the raw data
corPlot(sat.act,numbers=TRUE,stars=TRUE)
#from a correlation matrix with pvals
cp <- corr.test(sat.act)  #find the correlations and pvals
r<- cp$r
p <- cp$p
corPlot(r,numbers=TRUE,diag=FALSE,stars=TRUE, pval = p,main="Correlation plot
 with Holm corrected 'significance'")

#now red means less than .5
corPlot(mat.sort(Thurstone),TRUE,zlim=c(0,1), 
       main="9 cognitive variables from Thurstone (sorted by factor loading) ")
simp <- sim.circ(24)
corPlot(cor(simp),main="24 variables in a circumplex")

#scale by raw and adjusted probabilities
rs <- corr.test(sat.act[1:200,] ) #find the probabilities of the correlations
corPlot(r=rs$r,numbers=TRUE,pval=rs$p,main="Correlations scaled by probability values") 
 #Show the upper and lower confidence intervals
cor.plot.upperLowerCi(R=rs,numbers=TRUE) 

#now do this again, but with lighter colors
gr <- colorRampPalette(c("#B52127", "white", "#2171B5"))
corPlot(r=rs$r,numbers=TRUE,pval=rs$p,main="Correlations scaled by probability values",gr=gr) 
cor.plot.upperLowerCi(R=rs,numbers=TRUE,gr=gr) 



#do multiple plots 
#Also show the xaxis option
op <- par(mfrow=c(2,2))
corPlot(ability,show.legend=FALSE,keep.par=FALSE,upper=FALSE)
f4 <- fa(ability,4)
corPlot(f4,show.legend=FALSE,keep.par=FALSE,numbers=TRUE,xlas=3)
om <- omega(ability,4)
corPlot(om,show.legend=FALSE,keep.par=FALSE,numbers=TRUE,xaxis=3)
par(op)


corPlotUpperLowerCi(rs,adjust=TRUE,main="Holm adjusted confidence intervals",gr=gr)




