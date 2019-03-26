library(ss3sim)


### Name: sample_agecomp
### Title: Sample age compositions from expected values
### Aliases: sample_agecomp

### ** Examples

d <- system.file("extdata", package = "ss3sim")
f_in <- paste0(d, "/models/cod-om/codOM.dat")
dat_list <- r4ss::SS_readdat(f_in, verbose = FALSE)
dat_list <- change_fltname(dat_list)

## Turn off age comps by specifying fleets=NULL
sample_agecomp(dat_list=dat_list, outfile="test1.dat",
               fleets=NULL, cpar=c(5,NA), Nsamp=list(100,100),
               years=list(1995, 1995), write_file=FALSE)

## Generate with a smaller number of fleet taking samples
ex1 <- sample_agecomp(dat_list=dat_list, outfile="test1.dat", fleets=c(2),
                      Nsamp=list(c(10,50)), years=list(c(26,27)),
                      write_file=FALSE)

## Generate with varying Nsamp by year for first fleet
ex2 <- sample_agecomp(dat_list=dat_list, outfile="test2.dat", fleets=c(1,2),
                      Nsamp=list(c(rep(50, 5), rep(100, 5)), 50),
                      years=list(seq(26, 44, 2),
                          c(26:100)), write_file=FALSE)

## Run three  cases showing Multinomial, Dirichlet(1) and over-dispersed
## Dirichlet for different levels of sample sizes
op <- par(mfrow = c(1,3))
set.seed(1)
for(samplesize in c(30, 100, 1000)){
    ex4 <- sample_agecomp(dat_list=dat_list, outfile="test4.dat", fleets=c(1,2),
                          Nsamp=list(samplesize, samplesize),
                          write_file = FALSE,
                          years=list(50,50), cpar=c(NA, 1))
    ex5 <- sample_agecomp(dat_list=dat_list, outfile="test5.dat", fleets=c(1,2),
                          Nsamp=list(samplesize, samplesize),
                          write_file = FALSE,
                          years=list(50,50), cpar=c(1, 1))
    ex6 <- sample_agecomp(dat_list=dat_list, outfile="test6.dat", fleets=c(1,2),
                          Nsamp=list(samplesize, samplesize),
                          write_file = FALSE,
                          years=list(50,50), cpar=c(5, 1))
    true <- subset(dat_list$agecomp, FltSvy==1 & Yr == 50)[-(1:9)]
    true <- true/sum(true)
    mult <- subset(ex4$agecomp, FltSvy==1)[1,-(1:9)]
    mult <- mult/sum(mult)
    plot(1:15, mult, type="b", ylim=c(0,1),
         col=1, xlab="Age", ylab="Proportion", main=paste("Sample size=",
         samplesize))
    legend("topright", legend=c("Multinomial", "Dirichlet(1)",
                                "Dirichlet(5)", "Truth"),
           lty=1, col=1:4)
    lines((1:15), subset(ex5$agecomp, FltSvy==1)[1,-(1:9)], type="b", col=2)
    lines((1:15), subset(ex6$agecomp, FltSvy==1)[1,-(1:9)], type="b", col=3)
    lines((1:15), true, col=4, lwd=2)
}
par(op)



