library(serrsBayes)
context("Implementation of pseudo-Voigt broadening functions in Rcpp.")

test_that("mixedVoigt computes the spectral signature", {
  Cal_V <- seq(300,400,by=5)
  loc <- c(320,350,375)
  scG <- c(10,5,1)
  scL <- c(3,20,7)
  amp <- c(100,500,200)
  N_WN_Cal <- length(Cal_V)
  N_Peaks <- length(loc)
  Sample <- matrix(c(scG,scL,loc,amp), nrow=1, ncol=N_Peaks*4)
  k <- 1
  Conc_Cal <- 1
  Sigi<-rep(0,N_WN_Cal)
  for(j in 1:N_Peaks) {
    Temp_f<-(Sample[k,j]^5+2.69269*Sample[k,j]^4*Sample[k,N_Peaks+j]+2.42843*Sample[k,j]^3*Sample[k,N_Peaks+j]^2+4.47163*Sample[k,j]^2*Sample[k,N_Peaks+j]^3+0.07842*Sample[k,j]*Sample[k,N_Peaks+j]^4+Sample[k,N_Peaks+j]^5)^(1/5)
          
    Temp_e<-1.36603*(Sample[k,N_Peaks+j]/Temp_f)-0.47719*(Sample[k,N_Peaks+j]/Temp_f)^2+0.11116*(Sample[k,N_Peaks+j]/Temp_f)^3
            
    Sigi<-Sigi+Conc_Cal*Sample[k,3*N_Peaks+j]*(Temp_e*dcauchy(Cal_V,location=Sample[k,2*N_Peaks+j],scale=Temp_f/2)+(1-Temp_e)*dnorm(Cal_V,mean=Sample[k,2*N_Peaks+j],sd=Temp_f/(2*sqrt(2*log(2)))))/(Temp_e*(1/(pi*(Temp_f/2)))+(1-Temp_e)*(1/sqrt(2*pi*(Temp_f/(2*sqrt(2*log(2))))^2)))
  }
  expect_equal(mixedVoigt(loc,scG,scL,amp,Cal_V), Sigi)
})

test_that("getVoigtParam computes the pseudo-Voigt mixing ratio", {
  loc <- c(320,350,375)
  scG <- c(10,5,1)
  scL <- c(3,20,7)
  amp <- c(100,500,200)
  N_Peaks <- length(loc)
  Sample <- matrix(c(scG,scL,loc,amp), nrow=1, ncol=N_Peaks*4)
  k <- 1
  voigt <- numeric(N_Peaks)
  for(j in 1:N_Peaks) {
    Temp_f<-(Sample[k,j]^5+2.69269*Sample[k,j]^4*Sample[k,N_Peaks+j]+2.42843*Sample[k,j]^3*Sample[k,N_Peaks+j]^2+4.47163*Sample[k,j]^2*Sample[k,N_Peaks+j]^3+0.07842*Sample[k,j]*Sample[k,N_Peaks+j]^4+Sample[k,N_Peaks+j]^5)^(1/5)
    
    voigt[j]<-1.36603*(Sample[k,N_Peaks+j]/Temp_f)-0.47719*(Sample[k,N_Peaks+j]/Temp_f)^2+0.11116*(Sample[k,N_Peaks+j]/Temp_f)^3
  }
  expect_equal(getVoigtParam(scG,scL), voigt)
})

test_that("copyLogProposals for the four Voigt parameters", {
  # 3 peaks
  loc <- c(320,350,375)
  scG <- c(10,5,1)
  scL <- c(3,20,7)
  amp <- c(100,500,200)
  N_Peaks <- length(loc)
  Sample <- c(log(scG),log(scL),loc,log(amp))
  expect_equal(copyLogProposals(N_Peaks,Sample), c(scG,scL,loc,amp))
  
  # 1 peak
  loc <- c(320)
  scG <- c(10)
  scL <- c(3)
  amp <- c(100)
  N_Peaks <- length(loc)
  Sample <- c(log(scG),log(scL),loc,log(amp))
  expect_equal(copyLogProposals(N_Peaks,Sample), c(scG,scL,loc,amp))
})

