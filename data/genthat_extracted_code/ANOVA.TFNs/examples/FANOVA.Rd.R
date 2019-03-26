library(ANOVA.TFNs)


### Name: FANOVA
### Title: Fuzzy ANOVA Test
### Aliases: FANOVA
### Keywords: plotTFNs sst sstr sse mstr mse f sst.fuzzy sstr.fuzzy
###   sse.fuzzy mstr.fuzzy mse.fuzzy f.fuzzy FANOVA ANOVA

### ** Examples

# Example 1: 

data(Data)
head(Data)

FANOVA( Data )
FANOVA( Data, fig=FALSE )
FANOVA( Data, m=2, sig.level=0.1 )
FANOVA( Data, fig=FALSE  )$p_value
FANOVA( Data, fig=FALSE  )$FANOVA_test_result
FANOVA( Data, fig=FALSE  )[[1]]  ## No test: 
 # Only FANOVA Table 
## End(No test)


# Example 2: 
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




