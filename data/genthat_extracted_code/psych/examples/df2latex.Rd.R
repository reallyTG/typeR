library(psych)


### Name: df2latex
### Title: Convert a data frame, correlation matrix, or factor analysis
###   output to a LaTeX table
### Aliases: df2latex cor2latex fa2latex omega2latex irt2latex ICC2latex
### Keywords: utilities

### ** Examples

df2latex(Thurstone,rowlabels=FALSE,apa=FALSE,short.names=FALSE,
        caption="Thurstone Correlation matrix")
df2latex(Thurstone,heading="Thurstone Correlation matrix in APA style")

df2latex(describe(sat.act)[2:10],short.names=FALSE)
cor2latex(Thurstone)
cor2latex(sat.act,short.names=FALSE)
fa2latex(fa(Thurstone,3),heading="Factor analysis from R in quasi APA style")

#If using Sweave to create a LateX table as a separate file then set silent=TRUE
#e.g., 
#LaTex preamble 
#....
#<<print=FALSE,echo=FALSE>>= 
#f3 <- fa(Thurstone,3)
#fa2latex(f3,silent=TRUE,file='testoutput.tex')
#@
#
#\input{testoutput.tex}

 


