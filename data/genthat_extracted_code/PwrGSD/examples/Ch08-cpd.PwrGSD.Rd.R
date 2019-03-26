library(PwrGSD)


### Name: cpd.PwrGSD
### Title: Create a skeleton compound PwrGSD object
### Aliases: cpd.PwrGSD
### Keywords: data

### ** Examples

## don't worry--these examples are guaranteed to work,
## its just inconvenient for the package checker
## Not run: 
##D   library(PwrGSD)
##D 
##D ## In order to set up a compound object of class `cpd.PwrGSD'
##D ## we first construct a base case: a two arm trial randomized in just
##D ## under eight years with a maximum of 20 years of follow-up.
##D ## We compute power at a specific alternative, `rhaz', under
##D ## an interim analysis plan with roughly one annual analysis, some
##D ## crossover between intervention and control arms, with Efficacy
##D ## and futility boundaries constructed via the Lan-Demets procedure
##D ## with O'Brien-Fleming spending on the hybrid scale. Investigate
##D ## the behavior of three weighted log-rank statistics.
##D 
##D test.example <-
##D   PwrGSD(EfficacyBoundary = LanDemets(alpha = 0.05, spending = ObrienFleming),
##D          FutilityBoundary = LanDemets(alpha = 0.1, spending = ObrienFleming),
##D 	 RR.Futility = 0.82, sided="1<",method="A",accru =7.73, accrat =9818.65,
##D          tlook =c(7.14, 8.14, 9.14, 10.14, 10.64, 11.15, 12.14, 13.14,
##D                   14.14, 15.14, 16.14, 17.14, 18.14, 19.14, 20.14),
##D          tcut0 =0:19, h0 =c(rep(3.73e-04, 2), rep(7.45e-04, 3),
##D                             rep(1.49e-03, 15)),
##D          tcut1 =0:19, rhaz =c(1, 0.9125, 0.8688, 0.7814, 0.6941,
##D                               0.6943, 0.6072, 0.5202, 0.4332, 0.6520,
##D                               0.6524, 0.6527, 0.6530, 0.6534, 0.6537,
##D                               0.6541, 0.6544, 0.6547, 0.6551, 0.6554),
##D          tcutc0 =0:19, hc0 =c(rep(1.05e-02, 2), rep(2.09e-02, 3),
##D                               rep(4.19e-02, 15)),
##D          tcutc1 =0:19, hc1 =c(rep(1.05e-02, 2), rep(2.09e-02, 3),
##D                               rep(4.19e-02, 15)),
##D          tcutd0B =c(0, 13), hd0B =c(0.04777, 0),
##D          tcutd1B =0:6, hd1B =c(0.1109, 0.1381, 0.1485, 0.1637, 0.2446,
##D                                0.2497, 0),
##D          noncompliance =crossover, gradual =TRUE,
##D          WtFun =c("FH", "SFH", "Ramp"),
##D          ppar =c(0, 1, 0, 1, 10, 10))
##D 
##D ## we will construct a variety of alternate hypotheses relative to the
##D ## base case specified above
##D 
##D   rhaz <- 
##D     c(1, 0.9125, 0.8688, 0.7814, 0.6941, 0.6943, 0.6072, 0.5202, 0.4332,
##D     0.652, 0.6524, 0.6527, 0.653, 0.6534, 0.6537, 0.6541, 0.6544,
##D     0.6547, 0.6551, 0.6554)
##D 
##D   max.effect <- 0.80 + 0.05*(0:8)
##D   n.me <- length(max.effect)
##D 
##D ## we will also vary extent of censoring relative to the base case
##D ## specified above
##D 
##D   hc <- c(rep(0.0105, 2), rep(0.0209, 3), rep(0.0419, 15))
##D 
##D   cens.amt <- 0.75 + 0.25*(0:2)
##D   n.ca <- length(cens.amt)
##D 
##D ## we may also wish to compare the Lan-Demets/O'Brien-Fleming efficacy
##D ## boundary with a Lan-Demets/linear spending boundary
##D 
##D   Eff.bound.choice <- 1:2
##D   ebc.nms <- c("LanDemets(alpha=0.05, spending=ObrienFleming)",
##D                "LanDemets(alpha=0.05, spending=Pow(1))")
##D   n.ec <- length(Eff.bound.choice)
##D 
##D ## The following line creates the indexing dataframe, `descr', with one
##D ## line for each possible combination of the selection variables we've
##D ## created. 
##D 
##D 
##D   descr <- as.data.frame(
##D               cbind(Eff.bound.choice=rep(Eff.bound.choice, each=n.ca*n.me),
##D                     cens.amt=rep(rep(cens.amt, each=n.me), n.ec),
##D                     max.effect=rep(max.effect, n.ec*n.ca)))
##D 
##D   descr$Eff.bound.choice <- ebc.nms[descr$Eff.bound.choice]
##D 
##D ## Now descr contains one row for each combination of the levels of
##D ## the user defined selection variables, `Eff.bound.choice',
##D ## `max.effect' and `cens.amt'. Keep in mind that the names and number
##D ## of these variables is arbitrary. Next we create a skeleton
##D ## `cpd.PwrGSD' object with a call to the function `cpd.PwrGSD' with
##D ## argument `descr' 
##D 
##D   test.example.set <- cpd.PwrGSD(descr)
##D 
##D ## Now, the newly created object, of class `cpd.PwrGSD', contains
##D ## an element `descr', a component `date', the date created 
##D ## and a component `Elements', an empty list of length equal
##D ## to the number of rows in `descr'.  Next we do the computation in
##D ## a loop over the rows of `descr'.
##D 
##D   n.descr <- nrow(descr)
##D 
##D   for(k in 1:n.descr){
##D 
##D     ## First, we copy the original call to the current call,
##D     ## `Elements[[k]]$call'
##D 
##D     test.example.set$Elements[[k]]$call <- test.example$call
##D 
##D     ## Use the efficacy boundary choice in the kth row of `descr'
##D     ## to set the efficacy boundary choice in the current call
##D 
##D     test.example.set$Elements[[k]]$call$EfficacyBoundary <- 
##D     parse(text=as.character(descr[k,"Eff.bound.choice"]))[[1]]
##D 
##D     ## Derive the `rhaz' defined by the selection variable "max.effect"
##D     ## in the kth row of `descr' and use this to set the `rhaz'
##D     ## components of the current call
##D 
##D     test.example.set$Elements[[k]]$call$rhaz <-
##D                             exp(descr[k,"max.effect"] * log(rhaz))
##D 
##D     ## Derive the censoring components from the selection variable
##D     ## "cens.amt" in the kth row of `descr' and place that result
##D     ## into the current call
##D     
##D     test.example.set$Elements[[k]]$call$hc0 <-
##D     test.example.set$Elements[[k]]$call$hc1 <- descr[k, "cens.amt"] * hc
##D 
##D     ## Now the current call corresponds exactly to the selection
##D     ## variable values in row `k' of `descr'. The computation is
##D     ## done by calling `update'
##D 
##D     test.example.set$Elements[[k]] <- update(test.example.set$Elements[[k]])
##D     cat(k/n.descr, "\r")
##D   }
##D 
##D   ## We can create a new `cpd.PwrGSD' object by subsetting on
##D   ## the selection variables in `descr':
##D 
##D   Elements(test.example.set, 
##D            subset=(substring(Eff.bound.choice, 32, 34)=="Obr" &
##D                             max.effect >= 1))
##D 
##D 
##D   ## or we can plot the results -- see the help under `plot.cpd.PwrGSD'
##D 
##D   plot(test.example.set, formula = ~ max.effect | stat * cens.amt,
##D        subset=(substring(Eff.bound.choice, 32, 34)=="Obr"))
##D 
##D   plot(test.example.set, formula = ~ max.effect | stat * cens.amt,
##D        subset=(substring(Eff.bound.choice, 32, 34)=="Pow"))
##D 
##D   ## Notice the appearance of the selection variable `stat' which was
##D   ## not defined in the dataset `descr'. 
##D 
##D   ## Recall that each single "PwrGSD" object can contain results
##D   ## for a list of test statistics, as in the example shown here where
##D   ## we have results on three statistics per component of `Elements'.
##D   ## For this reason the variable `stat' can be also be referenced in
##D   ## the `subset' or `formula' arguments of calls to this `plot' method,
##D   ## and in the `subset' argument of the function `Power' shown below.
##D 
##D   ## The function `Power' is used to convert the `cpd.PwrGSD' object
##D   ## into  a dataframe, stacked by rows of `descr' and by `stat'
##D   ## (there are three statistics being profiled per each component of
##D   ## `Elements'), for generating tables or performing other 
##D   ## computations.
##D 
##D   Power(test.example.set,
##D         subset=(substring(Eff.bound.choice, 32, 34)=="Pow" & stat %in% c(1,3)))
##D 
##D   
## End(Not run)



