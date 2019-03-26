library(qualityTools)


### Name: mvPlot
### Title: Multi-Vari-Charts
### Aliases: mvPlot
### Keywords: Design of Experiments Six Sigma

### ** Examples

#Example I
examp1 = expand.grid(c("Engine1","Engine2","Engine3"),c(10,20,30,40))                  
examp1 = as.data.frame(rbind(examp1, examp1, examp1))
examp1 = cbind(examp1, rnorm(36, 1, 0.02))
names(examp1) = c("factor1", "factor2", "response")
test1=mvPlot(response = examp1[,3], fac1 = examp1[,2],
             fac2 = examp1[,1],sort=FALSE,las=2,FUN=mean) 

#Example II
examp2=expand.grid(c("Op I","Op II","Op III"),c(1,2,3,4),
                   c("20.11.1987","21.11.1987"))
examp2=as.data.frame(rbind(examp2, examp2, examp2))
examp2=cbind(examp2, rnorm(72, 22, 2))
names(examp2) = c("factor1", "factor2", "factor3", "response")
test2=mvPlot(response = examp2[,4], fac1 = examp2[,1],
            fac2 = examp2[,2], fac3 = examp2[,3], sort=TRUE, FUN=mean, 
            labels=TRUE)

#Example III
examp3 = expand.grid(c("A","B","C"),c("I","II","III","IV"),c("H","I"),
                     c(1,2,3,4,5))
examp3 = as.data.frame(rbind(examp3, examp3, examp3))
examp3 = cbind(examp3, rnorm(360, 0, 2))
names(examp3) = c("factor1", "factor2", "factor3", "factor4", "response")
test3=mvPlot(response = examp3[,5], fac1 = examp3[,1],
             fac2 = examp3[,2], fac3 = examp3[,3], fac4 = examp3[,4], sort=TRUE, 
             quantile=TRUE, FUN=mean)

 
                              

                




