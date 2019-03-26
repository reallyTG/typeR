library(ss3sim)


### Name: sample_lcomp
### Title: Sample length compositions from expected values
### Aliases: sample_lcomp

### ** Examples

d <- system.file("extdata", package = "ss3sim")
f_in <- paste0(d, "/models/cod-om/codOM.dat")
dat_list <- r4ss::SS_readdat(f_in, verbose = FALSE)
dat_list <- change_fltname(dat_list)

## Generate with constant sample size across years
ex1 <- sample_lcomp(dat_list=dat_list, outfile="test1.dat", fleets=c(1,2),
                    Nsamp=list(100,50), years=list(seq(26, 100, by=2),
                                            80:100), write_file = FALSE)

## Generate with varying Nsamp by year for first fleet
ex2 <- sample_lcomp(dat_list=dat_list, outfile="test2.dat", fleets=c(1,2),
                    Nsamp=list(c(rep(50, 5), rep(100, 5)), 50),
                    years=list(seq(26, 44, by=2),
                        80:100), write_file = FALSE)

## Not run: 
##D ## Plot distributions for a particular year to compare multinomial
##D ## vs. overdispersed Dirichlet
##D temp.list <- temp.list2 <- list()
##D for(i in 1:40){
##D     temp.list[[i]] <-
##D       sample_lcomp(dat_list=dat_list, outfile="test1.dat", fleets=c(2), cpar=c(3),
##D                      Nsamp=list(100), years=list(1995),
##D                      write_file=FALSE)
##D     temp.list2[[i]] <-
##D         sample_lcomp(dat_list=dat_list, outfile="test1.dat", fleets=c(2),
##D                      cpar=c(NA), Nsamp=list(100), years=list(1995),
##D                      write_file=FALSE)
##D }
##D ## Organize the data for plotting
##D x1 <- reshape2::melt(do.call(rbind, temp.list)[,-(1:6)[-3]], id.vars="FltSvy")
##D x2 <- reshape2::melt(do.call(rbind, temp.list2)[,-(1:6)[-3]], id.vars="FltSvy")
##D op <- par(mfrow=c(2,1))
##D with(x1, boxplot(value~variable, las=2, ylim=c(0,.6), ylab="Proportion",
##D                  main="Overdispersed (cpar=3)",  xlab="length bin"))
##D temp <- as.numeric(subset(dat_list$lencomp, Yr==1995 & FltSvy == 2)[-(1:6)])
##D points(temp/sum(temp), pch="-", col="red")
##D with(x2, boxplot(value~variable, las=2, ylim=c(0,.6), ylab="Proportion",
##D                  main="Multinomial", xlab="length bin"))
##D temp <- as.numeric(subset(dat_list$lencomp, Yr==1995 & FltSvy == 2)[-(1:6)])
##D points(temp/sum(temp), pch="-", col="red")
##D par(op)
## End(Not run)




