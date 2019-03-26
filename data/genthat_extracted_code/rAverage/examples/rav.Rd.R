library(rAverage)


### Name: rav
### Title: Analyzing the Family of the Averaging Models
### Aliases: rav indices-class rav-class show,rav-method
###   show,indices-method summary,rav-method
### Keywords: misc

### ** Examples
## Not run: 
##D # --------------------------------------
##D # Example 1: 3x3 factorial design
##D # --------------------------------------
##D # The first column is filled with a sequence of NA values.
##D data(fmdata1)
##D fmdata1
##D # For a two factors design, the matrix data contains the one-way
##D # sub-design and the two-ways full factorial design observed data.
##D # Pay attention to the columns order:
##D # sub-design: A1, A2, A3, B1, B2, B3
##D # full factorial: A1B1, A1B2, A1B3, A2B1, A2B2, A2B3, A3B1, A3B2, A3B3
##D # Start the R-Average procedure:
##D fm1 <- rav(fmdata1, lev=c(3,3))
##D # (notice that 'range' argument specifies the range of the response scale)
##D fm1 # print the best model selected
##D summary(fm1) # print the fitted models
##D 
##D # To insert the factor names:
##D fact.names <- c("Name of factor A", "Name of factor B")
##D fm1 <- rav(fmdata1, lev=c(3,3), names=fact.names)
##D 
##D # To insert a title for the output:
##D fm1 <- rav(fmdata1, lev=c(3,3), title="Put your title here")
##D 
##D # To supervise the information criterion work flow:
##D fm1 <- rav(fmdata1, lev=c(3,3), verbose=TRUE)
##D 
##D # To increase the number of iterations of the minimization routine:
##D fm1 <- rav(fmdata1, lev=c(3,3), control=list(maxit=5000))
##D 
##D # To change the estimation bounds for the scale parameters:
##D fm1.sMod <- rav(fmdata1, lev=c(3,3), s.range=c(0,20))
##D 
##D # To change the estimation bounds for the weight parameters:
##D fm1.wMod <- rav(fmdata1, lev=c(3,3), w.range=c(0.01,10))
##D 
##D # To set a fixed value for weights:
##D fm1.fix <- rav(fmdata1, lev=c(3,3), par.fixed="w")
##D 
##D # rav can work without sub-designs. If any sub-design is not available,
##D # the corresponding column must be coded with NA values. For example:
##D fmdata1[,1:3] <- NA
##D fmdata1
##D fmdata1 # the A sub-design is empty
##D fm1.bis <- rav(fmdata1, lev=c(3,3), title="Sub-design A is empty")
##D 
##D # Using a subset of data:
##D data(pasta)
##D pasta
##D # Analyzing "s04" only:
##D fact.names <- c("Price","Packaging")
##D fm.subj04 <- rav(pasta, subset="s04", lev=c(3,3), names=fact.names)
##D 
##D # --------------------------------------
##D # Example 2: 3x5 factorial design
##D # --------------------------------------
##D data(fmdata2)
##D fmdata2 # (pay attention to the columns order)
##D fm2 <- rav(fmdata2, lev=c(3,5))
##D # Removing all the one-way sub-design:
##D fmdata2[,1:8] <- NA
##D fm2.bis <- rav(fmdata2, lev=c(3,5))
##D 
##D # --------------------------------------
##D # Example 3: 3x2x3 factorial design
##D # --------------------------------------
##D data(fmdata3) # (pay attention to the columns order)
##D fm3 <- rav(fmdata3, lev=c(3,2,3))
##D # Removing all the one-way design and the AxC sub-design:
##D fmdata3[,1:8] <- NA # one-way designs
##D fmdata3[,15:23] <- NA # AxC design
##D fm3 <- rav(fmdata3, lev=c(3,2,3))
## End(Not run)


