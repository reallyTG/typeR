library(stheoreme)


### Name: pvalign
### Title: Probability Vector Formatting Tool
### Aliases: pvalign

### ** Examples

#consider 2 arrays {h0, h1} representing counts for 
#bins where bins are enumerated by corresponding x0 and x1 arrays:  
x0 <- -c(10,9,8,7,6,5,4.01,3)
x1 <- c(2,3,4,5,6,7,8)*(1.01)
h0 <- c(0,0,3,4,0,0,0.2,1)
h1 <- c(2,2,2,6,6,0,1)

#align regardless bin identifiers:
b<-pvalign(distribution0=h0, distribution1=h1); b
#align using bin identifiers:
b<-pvalign(h0, h1, outcomes0=x0, outcomes1=x1, tolerance=0.02); b
b$f0; b$f1; b$new_scale
#set small tolerance and observe an error generated:
 # b<-pvalign(h0, h1, x0, x1, tolerance=0.0001)

#example of 2-step data analysis with Klimontovich's S-theorem
# compare two bin counts:
h0<-c(1,1,1,1,1,1,1,1,1,1,1,1)
h1<-c(1,2,2,3,1,0,8,6)
# step a. Create probability vectors. It seems that s0 has lower level
# of orderliness (Shannon entropy is higher)
b<-pvalign(h0, h1); b
# step b. Compare with Klimontovich's S-theorem. Renormalized entropy shift
# is negligible compared to Shannon's. Evolution from state0 to state1 is possible
# but clearly with external entropy (or energy) outflow
crit.stheorem(b$f0,b$f1)
cxds.stheorem(b$f0,b$f1)



