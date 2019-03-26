library(relaimpo)


### Name: booteval.relimp
### Title: Functions to Bootstrap Relative Importance Metrics
### Aliases: boot.relimp boot.relimp.default boot.relimp.formula
###   boot.relimp.lm booteval.relimp
### Keywords: multivariate models htest

### ** Examples

#####################################################################
### Example: relative importance of various socioeconomic indicators 
###          for Fertility in Switzerland
### Fertility is first column of data set swiss
#####################################################################
data(swiss)
   # bootstrapping
       bootswiss <- boot.relimp(swiss, b = 100,  
                type = c("lmg", "last", "first", "pratt"),
                rank = TRUE, diff = TRUE, rela = TRUE)
       # for demonstration purposes only 100 bootstrap replications

       #alternatively, use formula interface
       bootsub <- boot.relimp(Fertility~Education+Catholic+Infant.Mortality, swiss, 
              subset=Catholic>40, b = 100, type = c("lmg", "last", "first", "pratt"),
              rank = TRUE, diff = TRUE)
       # for demonstration purposes only 100 bootstrap replications

   #default output (percentily intervals, as of Version 2 of the package)
    booteval.relimp(bootswiss)
    plot(booteval.relimp(bootswiss))

    #sorted printout, chosen confidence levels, chosen interval method
    #store as object
        result <- booteval.relimp(bootsub, bty="bca", 
              sort = TRUE, level=c(0.8,0.9))
         #because of only 100 bootstrap replications, 
         #default bca intervals produce warnings
    #output driven by print method
        result
    #result plotting with default settings 
    #(largest confidence level, names abbreviated to length 4)
        plot(result)
    #result plotting with modified settings (chosen confidence level, 
    #names abbreviated to chosen length)
        plot(result, level=0.8,names.abbrev=5)
    #result plotting with longer names shown vertically
        par(las=2)
        plot(result, level=0.9,names.abbrev=6)
    #plot does react to options set with par()
    #exceptions: mfrow, mar and oma are set within the plot routine itself

#####################################################################
### Example: bootstrapping clustered data                            
###          data taken from example.lmm of package lmm
### y is change in pulse (heart beats per minute) 
###    15 min (occ 1 to 3) and 90 min (occ 4 to 6) after 
###    treatment with Placebo (occ 1 or 4) low (occ 2 or 5) 
###    or high (occ 3 or 6) dose of marihuana
### each of 9 subjects is observed under most or all 
### of the 6 possible conditions
#####################################################################
## create example data from package lmm
y <- c(16,20,16,20,-6,-4,
    12,24,12,-6,4,-8,
    8,8,26,-4,4,8,
    20,8,20,-4,
    8,4,-8,22,-8,
    10,20,28,-20,-4,-4,
    4,28,24,12,8,18,
    -8,20,24,-3,8,-24,
    20,24,8,12)
occ <- c(1,2,3,4,5,6,
      1,2,3,4,5,6,
      1,2,3,4,5,6,
      1,2,5,6,
      1,2,3,5,6,
      1,2,3,4,5,6,
      1,2,3,4,5,6,
      1,2,3,4,5,6,
      2,3,4,5)
subj <- c(1,1,1,1,1,1,
       2,2,2,2,2,2,
       3,3,3,3,3,3,
       4,4,4,4,
       5,5,5,5,5,
       6,6,6,6,6,6,
       7,7,7,7,7,7,
       8,8,8,8,8,8,
       9,9,9,9)
### manual creation of dummies
### reference category placebo after 90min (occ=4)
dumm1 <- as.numeric(occ==1)
dumm2 <- as.numeric(occ==2)
dumm3 <- as.numeric(occ==3)
dumm5 <- as.numeric(occ==5)
dumm6 <- as.numeric(occ==6)

## create data frame
dat <- data.frame(y,dumm1,dumm2,dumm3,dumm5,dumm6,subj)

### create design with clusters
des <- svydesign(id=~subj,data=dat)

### apply bootstrapping
### using the design with subjects as clusters implies that 
###     clusters are generally kept in or excluded as a whole
### of course, b=100 is too small, only chosen for speed of package creation 
bt <- boot.relimp(y~dumm1+dumm2+dumm3+dumm5+dumm6,data=dat,
   design=des,b=100,type=c("lmg","first","last","betasq","pratt"))

### calculate and display results
booteval.relimp(bt,lev=0.9,nodiff=TRUE)




