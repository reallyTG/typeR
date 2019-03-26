library(DAAG)


### Name: elasticband
### Title: Elastic Band Data
### Aliases: elasticband
### Keywords: datasets

### ** Examples

print("Example 1.8.1")

attach(elasticband)     # R now knows where to find stretch and distance
plot(stretch, distance) # Alternative: plot(distance ~ stretch)
detach(elasticband)
pause()

print("Output of Data Frames - Example 12.3.2")

write(t(elasticband),file="bands.txt",ncol=2)

sink("bands2.txt")
elasticband   # NB: No output on screen
sink()

print("Lists - Example 12.7")

elastic.lm <- lm(distance ~ stretch, data=elasticband)
 names(elastic.lm)
 elastic.lm$coefficients
elastic.lm[["coefficients"]]
pause()

elastic.lm[[1]]
pause()

elastic.lm[1]
pause()

options(digits=3)
elastic.lm$residuals 
pause()

elastic.lm$call
pause()

 mode(elastic.lm$call)




