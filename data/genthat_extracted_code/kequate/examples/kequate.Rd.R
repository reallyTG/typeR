library(kequate)


### Name: kequate
### Title: Test Equating Using the Kernel Method
### Aliases: kequate kequateCB kequateEG kequateNEAT_CE kequateNEAT_PSE
###   kequateSG

### ** Examples

#EG toy example with different kernels
P<-c(5, 20, 35, 25, 15)
Q<-c(10, 30, 30, 20, 10)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
glmy<-glm(Q~I(x)+I(x^2), family="poisson", x=TRUE)
keEG<-kequate("EG", 0:4, 0:4, glmx, glmy)
keEGlog<-kequate("EG", 0:4, 0:4, glmx, glmy, kernel="logistic", slog=sqrt(3)/pi)
keEGuni<-kequate("EG", 0:4, 0:4, glmx, glmy, kernel="uniform", bunif=sqrt(3))
plot(keEG)

## Not run: 
##D #NEAT example using simulated data
##D data(simeq)
##D freq1 <- kefreq(simeq$bivar1$X, 0:20, simeq$bivar1$A, 0:10)
##D freq2 <- kefreq(simeq$bivar2$Y, 0:20, simeq$bivar2$A, 0:10)
##D glm1<-glm(frequency~I(X)+I(X^2)+I(X^3)+I(X^4)+I(X^5)+I(A)+I(A^2)+I(A^3)+I(A^4)+
##D I(A):I(X)+I(A):I(X^2)+I(A^2):I(X)+I(A^2):I(X^2), family="poisson", data=freq1, x=TRUE)
##D glm2<-glm(frequency~I(X)+I(X^2)+I(A)+I(A^2)+I(A^3)+I(A^4)+I(A):I(X)+I(A):I(X^2)+
##D I(A^2):I(X)+I(A^2):I(X^2), family="poisson", data=freq2, x=TRUE)
##D keNEATPSE <- kequate("NEAT_PSE", 0:20, 0:20, glm1, glm2)
##D keNEATCE <- kequate("NEAT_CE", 0:20, 0:20, 0:10, glm1, glm2)
##D summary(keNEATPSE)
##D summary(keNEATCE)
##D 
##D #IRT observed-score equating
##D keNEATCEirt <- kequate("NEAT_CE", 0:20, 0:20, 0:10, glm1, glm2, irtx=simeq$irtNEATx, 
##D irty=simeq$irtNEATy)
##D getEquating(keNEATCEirt)
## End(Not run)



