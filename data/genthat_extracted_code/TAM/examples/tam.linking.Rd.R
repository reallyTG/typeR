library(TAM)


### Name: tam.linking
### Title: Linking of Fitted Unidimensional Item Response Models in 'TAM'
### Aliases: tam.linking summary.tam.linking tam_linking_2studies
###   summary.tam_linking_2studies print.tam.linking
###   print.tam_linking_2studies

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Linking dichotomous data with the 2PL model
##D #############################################################################
##D 
##D data(data.ex16)
##D dat <- data.ex16
##D items <- colnames(dat)[-c(1,2)]
##D 
##D # fit grade 1
##D rdat1 <- TAM::tam_remove_missings( dat[ dat$grade==1, ], items=items )
##D mod1 <- TAM::tam.mml.2pl( resp=rdat1$resp[, rdat1$items], pid=rdat1$dat$idstud )
##D summary(mod1)
##D 
##D # fit grade 2
##D rdat2 <- TAM::tam_remove_missings( dat[ dat$grade==2, ], items=items )
##D mod2 <- TAM::tam.mml.2pl( resp=rdat2$resp[, rdat2$items], pid=rdat2$dat$idstud )
##D summary(mod2)
##D 
##D # fit grade 3
##D rdat3 <- TAM::tam_remove_missings( dat[ dat$grade==3, ], items=items )
##D mod3 <- TAM::tam.mml.2pl( resp=rdat3$resp[, rdat3$items], pid=rdat3$dat$idstud )
##D summary(mod3)
##D 
##D # define list of fitted models
##D tamobj_list <- list( mod1, mod2, mod3 )
##D 
##D #-- link item response models
##D lmod <- TAM::tam.linking( tamobj_list)
##D summary(lmod)
##D 
##D # estimate WLEs based on transformed item parameters
##D parm_list <- lmod$parameters_list
##D 
##D # WLE grade 1
##D arglist <- list( resp=mod1$resp, B=parm_list[[1]]$B, AXsi=parm_list[[1]]$AXsi )
##D wle1 <- TAM::tam.mml.wle(tamobj=arglist)
##D 
##D # WLE grade 2
##D arglist <- list( resp=mod2$resp, B=parm_list[[2]]$B, AXsi=parm_list[[2]]$AXsi )
##D wle2 <- TAM::tam.mml.wle(tamobj=arglist)
##D 
##D # WLE grade 3
##D arglist <- list( resp=mod3$resp, B=parm_list[[3]]$B, AXsi=parm_list[[3]]$AXsi )
##D wle3 <- TAM::tam.mml.wle(tamobj=arglist)
##D 
##D #############################################################################
##D # EXAMPLE 2: Linking polytomous data with the partial credit model
##D #############################################################################
##D 
##D data(data.ex17)
##D dat <- data.ex17
##D 
##D items <- colnames(dat)[-c(1,2)]
##D 
##D # fit grade 1
##D rdat1 <- TAM::tam_remove_missings( dat[ dat$grade==1, ], items=items )
##D mod1 <- TAM::tam.mml.2pl( resp=rdat1$resp[, rdat1$items], pid=rdat1$dat$idstud )
##D summary(mod1)
##D 
##D # fit grade 2
##D rdat2 <- TAM::tam_remove_missings( dat[ dat$grade==2, ], items=items )
##D mod2 <- TAM::tam.mml.2pl( resp=rdat2$resp[, rdat2$items], pid=rdat2$dat$idstud )
##D summary(mod2)
##D 
##D # fit grade 3
##D rdat3 <- TAM::tam_remove_missings( dat[ dat$grade==3, ], items=items )
##D mod3 <- TAM::tam.mml.2pl( resp=rdat3$resp[, rdat3$items], pid=rdat3$dat$idstud )
##D summary(mod3)
##D 
##D # list of fitted TAM models
##D tamobj_list <- list( mod1, mod2, mod3 )
##D 
##D #-- linking: fix slope because partial credit model is fitted
##D lmod <- TAM::tam.linking( tamobj_list, fix.slope=TRUE)
##D summary(lmod)
##D 
##D # WLEs can be estimated in the same way as in Example 1.
##D 
##D #############################################################################
##D # EXAMPLE 3: Linking dichotomous data with the multiple group 2PL models
##D #############################################################################
##D 
##D data(data.ex16)
##D dat <- data.ex16
##D items <- colnames(dat)[-c(1,2)]
##D 
##D # fit grade 1
##D rdat1 <- TAM::tam_remove_missings( dat[ dat$grade==1, ], items=items )
##D # create some grouping variable
##D group <- ( seq( 1, nrow( rdat1$dat ) ) %% 3 ) + 1
##D mod1 <- TAM::tam.mml.2pl( resp=rdat1$resp[, rdat1$items], pid=rdat1$dat$idstud, group=group)
##D summary(mod1)
##D 
##D # fit grade 2
##D rdat2 <- TAM::tam_remove_missings( dat[ dat$grade==2, ], items=items )
##D group <- 1*(rdat2$dat$dat$idstud > 500)
##D mod2 <- TAM::tam.mml.2pl( resp=rdat2$resp[, rdat2$items], pid=rdat2$dat$dat$idstud, group=group)
##D summary(mod2)
##D 
##D # fit grade 3
##D rdat3 <- TAM::tam_remove_missings( dat[ dat$grade==3, ], items=items )
##D mod3 <- TAM::tam.mml.2pl( resp=rdat3$resp[, rdat3$items], pid=rdat3$dat$idstud )
##D summary(mod3)
##D 
##D # define list of fitted models
##D tamobj_list <- list( mod1, mod2, mod3 )
##D 
##D #-- link item response models
##D lmod <- TAM::tam.linking( tamobj_list)
##D 
##D #############################################################################
##D # EXAMPLE 4: Linking simulated dichotomous data with two groups
##D #############################################################################
##D 
##D library(sirt)
##D 
##D #*** simulate data
##D N <- 3000  # number of persons
##D I <- 30    # number of items
##D b <- seq(-2,2, length=I)
##D # data for group 1
##D dat1 <- sirt::sim.raschtype( rnorm(N, mean=0, sd=1), b=b )
##D # data for group 2
##D dat2 <- sirt::sim.raschtype( rnorm(N, mean=1, sd=.6), b=b )
##D 
##D # fit group 1
##D mod1 <- TAM::tam.mml.2pl( resp=dat1 )
##D summary(mod1)
##D 
##D # fit group 2
##D mod2 <- TAM::tam.mml.2pl( resp=dat2 )
##D summary(mod2)
##D 
##D # define list of fitted models
##D tamobj_list <- list( mod1, mod2 )
##D 
##D #-- link item response models
##D lmod <- TAM::tam.linking( tamobj_list)
##D summary(lmod)
##D 
##D # estimate WLEs based on transformed item parameters
##D parm_list <- lmod$parameters_list
##D 
##D # WLE grade 1
##D arglist <- list( resp=mod1$resp, B=parm_list[[1]]$B, AXsi=parm_list[[1]]$AXsi )
##D wle1 <- TAM::tam.mml.wle(tamobj=arglist)
##D 
##D # WLE grade 2
##D arglist <- list( resp=mod2$resp, B=parm_list[[2]]$B, AXsi=parm_list[[2]]$AXsi )
##D wle2 <- TAM::tam.mml.wle(tamobj=arglist)
##D summary(wle1)
##D summary(wle2)
##D 
##D # estimation with linked and fixed item parameters for group 2
##D B <- parm_list[[2]]$B
##D xsi.fixed <- cbind( 1:I, -parm_list[[2]]$AXsi[,2] )
##D mod2f <- TAM::tam.mml( resp=dat2, B=B, xsi.fixed=xsi.fixed )
##D summary(mod2f)
## End(Not run)



