library(dejaVu)


### Name: ImportSim
### Title: Import an existing data frame for use with the package
### Aliases: ImportSim

### ** Examples


covar.df <- data.frame(Id=1:6,
                       arm=c(rep(0,3),rep(1,3)),
                       Z=c(0,1,1,0,1,0))
 
dejaData <- MakeDejaData(covar.df,arm="arm",Id="Id") 


event.times <- list(c(25,100,121,200,225),
                    c(100,110),c(55),numeric(0),
                    150,45)     

complete.dataset <- ImportSim(dejaData, event.times,
                    status="complete",
                    study.time=365)
 
censored.time  <- c(365,178,100,245,200,100)

dropout.dataset <- ImportSim(dejaData, event.times,
                    status="dropout",
                    study.time=365,
                    censored.time=censored.time)




