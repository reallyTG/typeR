library(ANOVA.TFNs)


### Name: ANOVA.TFNs-package
### Title: One-Way Analysis of Variance Based on Triangular Fuzzy Numbers
### Aliases: ANOVA.TFNs-package ANOVA.TFNs

### ** Examples

## Example 1 (input TFNs in \code{FANOVA.Data} format)
data(Data)
head(Data)
Data[,"R"]
Data[,"C"][Data[,"factor"]==2]  ## No test: 
 # Or Data[,"C"][Data[,4]==2] 
## End(No test)


## Example 2:  
FANOVA( Data, m=2, sig.level=0.1 )


## Example 3: 
t <- 20
f <-p <- c()

for(i in 1:t){
		 f[i] <- FANOVA(Data, m=i, fig=FALSE)$f_ob
		 p[i] <- FANOVA(Data, m=i, fig=FALSE)$p_value
		 }

par(mfcol=c(2,1))
  plot(1:t, f, main="FANOVA test statistics (f) v.s m (1:20)")
  plot(1:t, p, main="p-value v.s m (1:20)")
par(mfcol=c(1,1))




