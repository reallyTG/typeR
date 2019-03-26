data("demoLGCM")
demoLGCM <- demoLGCM[sample(1:nrow(demoLGCM),nrow(demoLGCM)),]
meanf <- 'muI+muS*t'
covf <- 'varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma'
lgcm <- gppm(meanf,covf,demoLGCM,'ID','x')
parameterValues <- c(58,-1,258,0.4,0, 10)
names(parameterValues) <-c('muI','muS','varI','varS','covIS','sigma')
simData <- simulate(lgcm,parameterValues,nsim=100)

counter <- rep(0,length(pars(lgcm)))
names(counter) <- pars(lgcm)
N <- 100
res <- list()
for (i in seq_len(N)){
  tryCatch({
    lgcmFake <- gppm(meanf,covf,simData[[i]])
    lgcmFake <- fit(lgcmFake)
    res[[i]] <- confints <- confint(lgcmFake)
  }, error = function(e) {
    print(e$message)
    res[[i]] <- 'error'
  })
}

counters <- rep(0,(length(parameterValues)))
names(counters) <- names(parameterValues)
nonError <- 0
for (i in seq_len(length(res))){
  if (res[[i]]!='error'){
    confints <- res[[i]]
    nonError <- nonError + 1
    for (j in seq_len(length(counters))){
      cPar <- names(counters)[j]
      cConfints <- confints[cPar,]
      if (cConfints[1] < parameterValues[cPar] && cConfints[2] > parameterValues[cPar]){
        counters[cPar] <- counters[cPar] +1
      }
    }
  }
}


