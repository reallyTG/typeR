library(cuttlefish.model)


### Name: delta.glm
### Title: LPUE standardisation using Delta-GLM method
### Aliases: delta.glm
### Keywords: ~kwd1 ~kwd2

### ** Examples


data(fr.data.lpue)

fr.delta.glm<-delta.glm(input.data=fr.data.lpue)


par(mfrow = c(2,2))
#Histogram of the binomial error GLM residuals
hist(fr.delta.glm$binomial.residuals)

#Plot with the fitted data on the x axis and and the re
plot(fr.delta.glm$binomial.fit, fr.delta.glm$binomial.residuals)

#QQplot of the residuals from the binomial error GLM
qqnorm(fr.delta.glm$binomial.residuals)
qqline(fr.delta.glm$binomial.residuals)


par(mfrow = c(2,2))
#Histogram of the residuals from the Gaussian error GLM
hist(fr.delta.glm$gaussian.residuals)
	
#Plot of fitted values vs residuals from the Gaussian error GLM
plot(fr.delta.glm$gaussian.fit,fr.delta.glm$gaussian.residuals)
qqnorm(fr.delta.glm$gaussian.residuals)
qqline(fr.delta.glm$gaussian.residuals)

#Aggregation of the standardised LPUE per year. Aggregation 
#can be done on the 3 other factors in the same way.
fr.yearly.lpue<-aggregate(fr.delta.glm$predicted.lpue$st.lpue, 
list(fr.delta.glm$predicted.lpue$fishing.season), FUN="mean")
fr.yearly.lpue<-data.frame(c(1900:1905), fr.yearly.lpue)
colnames(fr.yearly.lpue)<-c("year","fishing.season","fr.st.lpue")





