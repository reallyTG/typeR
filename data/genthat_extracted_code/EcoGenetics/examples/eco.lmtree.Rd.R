library(EcoGenetics)


### Name: eco.lmtree
### Title: Fitting Multiple Linear Regression models by stepwise AIC
###   selection and Multiple Classification and Regression Trees via party
### Aliases: eco.lmtree

### ** Examples


## Not run: 
##D 
##D data(eco.test)
##D 
##D # mlm additive model
##D mod <- eco.lmtree(df1 = eco3[["P"]], df2 = eco3[["E"]], 
##D analysis = "mlm")                                 
##D mod
##D summary(mod)
##D 
##D # mctree additive model
##D mod <- eco.lmtree(df1 = eco3[["P"]], df2 = eco3[["E"]], 
##D analysis = "mctree", fact = eco3[["S"]]$pop) 
##D 
##D 
##D #-----------------------
##D # ACCESSORS USE EXAMPLE
##D #-----------------------
##D 
##D # the slots are accessed with the generic format 
##D # (ecoslot. + name of the slot + name of the object). 
##D # See help("EcoGenetics accessors")
##D 
##D summary(mod)
##D 
##D ecoslot.FREQUENCIES(mod)        # slot FREQUENCIES
##D 
##D # frequency table with counts of individuals in populations x terminal nodes
##D tabfreq <- do.call(cbind, ecoslot.FREQUENCIES(mod))
##D namestab <- lapply(ecoslot.FREQUENCIES(mod), ncol)
##D namestab <- lapply(namestab, rep)
##D namestab <- rep(names(namestab), namestab)
##D colnames(tabfreq) <- namestab
##D tabfreq
##D 
##D # mlm custom model
##D mymod <- "E1+E2*E3"
##D mod <- eco.lmtree(df1 = eco[["P"]], df2 = eco[["E"]], 
##D analysis = "mlm", mod.class = mymod)            
##D summary(mod)
##D 
##D # mctree custom model
##D mod <- eco.lmtree(df1 = eco[["P"]], df2 = eco[["E"]], 
##D analysis = "mctree", mod.class = mymod, fact = eco[["S"]]$pop)   
##D  
##D                       
##D summary(mod)
##D 
## End(Not run)




