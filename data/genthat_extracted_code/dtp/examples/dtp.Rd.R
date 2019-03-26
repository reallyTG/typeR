library(dtp)


### Name: dtp
### Title: Dynamic threshold panel function
### Aliases: dtp

### ** Examples

############################################
# Fit the dynamic threshold panel data
############################################
# Load data
data(Mena)
############################################
# Estimate the model
############################################
reg<-dtp(GDPPC ~ FDI+OPEN|INF|INF,Mena,index=c("pays","ann"),4,2,0.95,0.8,1,graph = TRUE)
summary(reg)





