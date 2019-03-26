library(psych)


### Name: cor.ci
### Title: Bootstrapped confidence intervals for raw and composite
###   correlations
### Aliases: cor.ci corCi
### Keywords: multivariate models

### ** Examples

cor.ci(bfi[1:200,1:10])  # just the first 10 variables
#The keys have overlapping scales
  keys.list <- list(agree=c("-A1","A2","A3","A4","A5"), conscientious= c("C1", 
  "C2","C3","-C4","-C5"),extraversion=c("-E1","-E2","E3","E4","E5"), neuroticism= 
  c("N1", "N2", "N3","N4","N5"), openness = c("O1","-O2","O3","O4","-O5"), 
  alpha=c("-A1","A2","A3","A4","A5","C1","C2","C3","-C4","-C5","N1","N2","N3","N4","N5"),
beta = c("-E1","-E2","E3","E4","E5","O1","-O2","O3","O4","-O5") )
  keys <- make.keys(bfi,keys.list)
  
#do not correct for item overlap
rci <-  cor.ci(bfi[1:200,],keys,n.iter=10,main="correlation with overlapping scales") 
#also shows the graphic -note the overlap
#correct for overlap
rci <-  cor.ci(bfi[1:200,],keys,overlap=TRUE, n.iter=10,main="Correct for overlap") 
#show the confidence intervals
ci <- cor.plot.upperLowerCi(rci)  #to show the upper and lower confidence intervals
ci   #print the confidence intervals in matrix form



